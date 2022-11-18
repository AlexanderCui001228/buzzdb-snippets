#include <gtest/gtest.h>
#include <thread>
#include "rw_latches/rw_latches.h"

namespace {

using namespace std::literals::string_literals;
using namespace buzzdb::rw_latches;
using namespace buzzdb::utils;

TEST(RWLatchesTest, SingleThreadAddStudentDuplicate) {
    StudentDB db = StudentDB();
    ASSERT_TRUE(db.add_student(1, "student_1"));
    ASSERT_TRUE(db.add_student(2, "student_2"));
    ASSERT_TRUE(db.add_student(3, "student_3"));
    ASSERT_FALSE(db.add_student(1, "student_1"));

    ASSERT_EQ(3, db.get_size());
}

TEST(RWLatchesTest, SingleThreadDeleteStudent) {
    StudentDB db = StudentDB();
    ASSERT_TRUE(db.add_student(1, "student_1"));
    ASSERT_TRUE(db.add_student(2, "student_2"));
    ASSERT_TRUE(db.add_student(3, "student_3"));
    ASSERT_TRUE(db.delete_student(1));
    ASSERT_TRUE(db.delete_student(2));
    ASSERT_FALSE(db.delete_student(1));
    ASSERT_FALSE(db.delete_student(4));

    ASSERT_EQ(1, db.get_size());
}

TEST(RWLatchesTest, SingleThreadAddCourse) {
    StudentDB db = StudentDB();
    ASSERT_TRUE(db.add_student(1, "student_1"));
    ASSERT_TRUE(db.add_student_course(1, 1, "course_1"));
    ASSERT_TRUE(db.add_student_course(1, 2, "course_2"));
    ASSERT_FALSE(db.add_student_course(1, 2, "course_2"));
    ASSERT_EQ(1, db.get_size());

    Student student = db.get_student(1);
    ASSERT_EQ(student._current_number_of_courses, 2);
    ASSERT_EQ(student._current_number_of_courses, student._courses.size());
    ASSERT_EQ(student._courses[0]->_course_id, 1);
    ASSERT_EQ(student._courses[0]->_course_name, "course_1");
    ASSERT_EQ(student._courses[1]->_course_id, 2);
    ASSERT_EQ(student._courses[1]->_course_name, "course_2");
}

TEST(RWLatchesTest, SingleThreadDeleteCourse) {
    StudentDB db = StudentDB();
    ASSERT_TRUE(db.add_student(1, "student_1"));
    ASSERT_TRUE(db.add_student_course(1, 1, "course_1"));
    ASSERT_TRUE(db.add_student_course(1, 2, "course_2"));
    ASSERT_TRUE(db.add_student_course(1, 3, "course_3"));
    ASSERT_TRUE(db.drop_student_course(1, 1));
    ASSERT_TRUE(db.drop_student_course(1, 3));
    ASSERT_FALSE(db.drop_student_course(1, 4));
    ASSERT_FALSE(db.drop_student_course(1, 1));
    ASSERT_EQ(1, db.get_size());

    Student student = db.get_student(1);
    ASSERT_EQ(student._current_number_of_courses, 1);
    ASSERT_EQ(student._current_number_of_courses, student._courses.size());
    ASSERT_EQ(student._courses[0]->_course_id, 2);
    ASSERT_EQ(student._courses[0]->_course_name, "course_2");
}

TEST(RWLatchesTest, MultiThreadAddStudents) {
    StudentDB db = StudentDB();
    std::vector<std::thread> threads;
    for (int i = 0; i < 8; i++) {
        threads.emplace_back([&db, i] {
            for (int j = 0; j < 10; j++) {
                int new_student_id = (i * 100) + j;
                ASSERT_TRUE(db.add_student(new_student_id, "student_" + std::to_string(j)));
            }
        });
    }

    threads.emplace_back([&db] {
        for (int j = 0; j < 10; j++) {
            int new_student_id = 200 + j;
            ASSERT_FALSE(db.add_student(new_student_id, "student_" + std::to_string(j)));
        }
    });

    for (auto& thread : threads) {
        thread.join();
    }
    ASSERT_EQ(db.get_size(), 80);
}

TEST(RWLatchesTest, MultiThreadDeleteStudents) {
    StudentDB db = StudentDB();
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 10; j++) {
            int new_student_id = j + (i * 100);
            ASSERT_TRUE(db.add_student(new_student_id, "student_" + std::to_string(j)));
        }
    }
    std::vector<std::thread> threads;

    for (int i = 0; i < 6; i++) {
        threads.emplace_back([&db, i] {
            for (int j = 0; j < 10; j++) {
                int new_student_id = (i * 100) + j;
                ASSERT_TRUE(db.delete_student(new_student_id));
            }
        });
    }

    for (auto& thread : threads) {
        thread.join();
    }
    ASSERT_EQ(db.get_size(), 20);
}

TEST(RWLatchesTest, MultiThreadAddCourses) {
    StudentDB db = StudentDB();
    db.add_student(1, "student_1");
    std::vector<std::thread> threads;
    for (int i = 0; i < 5; i++) {
        threads.emplace_back([&db, i] {
            for (int j = 0; j < 2; j++) {
                int new_course_id = (i * 100) + j;
                db.add_student_course(1, new_course_id, "course_" + std::to_string(j));
            }
        });
    }

    for (auto& thread : threads) {
        thread.join();
    }
    ASSERT_EQ(db.get_student(1)._courses.size(), 3);
}

TEST(RWLatchesTest, MultiThreadDeleteCourses) {
    StudentDB db = StudentDB();
    db.add_student(1, "student_1");
    for (int j = 0; j < 3; j++) {
        db.add_student_course(1, j, "course_" + std::to_string(j));
    }

    std::vector<std::thread> threads;
    for (int i = 0; i < 3; i++) {
        threads.emplace_back([&db, i] {
            for (int j = 0; j < 2; j++) {
                int course_id = i + j;
                db.drop_student_course(1, course_id);
            }
        });
    }

    for (auto& thread : threads) {
        thread.join();
    }
    ASSERT_EQ(db.get_student(1)._courses.size(), 0);
}
}

int main(int argc, char *argv[]) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

