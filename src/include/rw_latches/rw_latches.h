#pragma once

#include <mutex>
#include <condition_variable>
#include <unordered_map>
#include <shared_mutex>

#include "utils/tutorial.h"

namespace buzzdb::rw_latches {

// This class illustrates how reader writer latch can leverage multi-threading on managing a list of some students
// who taking a given amount of courses.
class StudentDB {
    private:
        // Main data structure that maps student id to student object.
        std::unordered_map<int, utils::Student> student_table;

        // Keeps track of table size.
        uint64_t table_size = 0;

        // Read lock. Notice this is a shared mutex such that other shared mutex can access a piece of resource
        // that is only owned by some shared mutexes. This is because when a reader is reading, other readers are
        // safe to read shared resource as long as no writing is involved, therefore optimizing runtime.
        std::shared_mutex read_lock;

        // Write lock. Notice this is an exclusive mutex such that all other mutex should wait in order to access
        // shared resource. This is because we don't want any reader or writer to access interfere with a write
        // operation in progress.
        std::mutex write_lock;

    public:

        // Adds a new student to record. This needs an exclusive write lock.
        bool add_student(int student_id, std::string student_name);

        // Deletes a student from record. This needs an exclusive write lock.
        bool delete_student(int student_id);

        // Let a student add a new course. This needs an exclusive write lock.
        bool add_student_course(int student_id, int course_id, std::string course_name);

        // Let a student drop a course. This needs an exclusive write lock.
        bool drop_student_course(int student_id, int course_id);

        // Retrieve record of a student. This only needs a shared read lock.
        utils::Student get_student(int student_id);

        // Retrieve and visualize record of a student. This only needs a shared read lock.
        bool view_student(int student_id);

        // Retrieve the size of records. THis only needs a shared read lock.
        uint64_t get_size();

        // Default constructor.
        StudentDB() = default;
    };
}

