#include <iostream>
#include <utility>
#include "rw_latches/rw_latches.h"
#include "utils/tutorial.h"

namespace buzzdb::rw_latches {
bool StudentDB::add_student(int student_id, std::string student_name) {
    write_lock.lock();
    if (student_table.find(student_id) != student_table.end()) {
        std::cout << "Student already exists: " << student_id << "\n";
        write_lock.unlock();
        return false;
    }

    utils::Student new_student = utils::Student(student_id, student_name);
    student_table.insert(std::pair<int, utils::Student>(student_id, new_student));
    table_size++;
    write_lock.unlock();

    return true;
}

bool StudentDB::delete_student(int student_id) {
    write_lock.lock();
    if (student_table.find(student_id) == student_table.end()) {
        std::cout << "Student doesn't exist: " << student_id << "\n";
        write_lock.unlock();
        return false;
    }

    student_table.erase(student_id);
    table_size--;
    write_lock.unlock();

    return true;
}

bool StudentDB::add_student_course(int student_id, int course_id, std::string course_name) {
    write_lock.lock();
    if (student_table.find(student_id) == student_table.end()) {
        std::cout << "Student doesn't exist: " << student_id << "\n";
        write_lock.unlock();
        return false;
    }

    bool status = student_table.at(student_id).add_course(course_id, course_name);
    write_lock.unlock();
    return status;
}

bool StudentDB::drop_student_course(int student_id, int course_id) {
    write_lock.lock();
    if (student_table.find(student_id) == student_table.end()) {
        std::cout << "Student doesn't exist: " << student_id << "\n";
        write_lock.unlock();
        return false;
    }

    bool status = student_table.at(student_id).drop_course(course_id);
    write_lock.unlock();
    return status;
}

utils::Student StudentDB::get_student(int student_id) {
    read_lock.lock_shared();
    if (student_table.find(student_id) == student_table.end()) {
        std::cout << "Student doesn't exist: " << student_id << "\n";
        read_lock.unlock_shared();
        throw std::logic_error("invalid student id");
    }
    read_lock.unlock_shared();

    return student_table.at(student_id);
}

bool StudentDB::view_student(int student_id) {
    read_lock.lock_shared();
    if (student_table.find(student_id) == student_table.end()) {
        std::cout << "Student doesn't exist: " << student_id << "\n";
        read_lock.unlock_shared();
        return false;
    }

    std::cout << "student id: " << student_id << "\n";
    std::cout << "student name: " << student_table.at(student_id)._student_name << "\n";
    std::cout << "student courses: " << student_table.at(student_id)._student_name << "\n";
    read_lock.unlock_shared();
    return true;
}

uint64_t StudentDB::get_size() {
    read_lock.lock_shared();
    uint64_t size = table_size;
    read_lock.unlock_shared();
    return size;
}
}
