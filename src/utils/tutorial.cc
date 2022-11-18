// This file is an introduction to C++ for C programmers.
// It is based on: https://github.com/rougier/CPP-Crash-Course


#include <string>
#include <iostream>
#include <stdexcept>
#include <vector>

#include "utils/tutorial.h"

namespace buzzdb{
namespace utils {

#define UNUSED(p) ((void)(p))

//////////////////////////////////////////////////////////////////////////////
///// COURSE CLASS
//////////////////////////////////////////////////////////////////////////////

Course::Course(){
    _course_id = -1;
    _course_name = "";
}

Course::Course(int course_id, std::string course_name):
    _course_id(course_id),
    _course_name(course_name){
}

Course::Course(const Course& course_being_copied):
    _course_id(course_being_copied._course_id),
    _course_name(course_being_copied._course_name){
}

Course::~Course() {
    delete this;
}

std::ostream& operator <<(std::ostream& os, const Course& course)
{
    os << "Course :: " << course._course_id << " - " << course._course_name << "\n";
    return os;
}

bool operator==(const Course& course1, const Course& course2)
{
    return (course1._course_id == course2._course_id) 
        && (course1._course_name == course2._course_name);
}

Course& Course::operator=(const Course& course_being_copied){
    _course_id = course_being_copied._course_id;
    _course_name = course_being_copied._course_name;    
    // return the assigned course object 
    return *this;
}


//////////////////////////////////////////////////////////////////////////////
///// STUDENT CLASS
//////////////////////////////////////////////////////////////////////////////

Student::Student(int student_id, std::string student_name):
    _student_id(student_id),
    _student_name(student_name){
    _courses = std::vector<Course *>();
    _current_number_of_courses = 0;
}

/*
Student::~Student(){
    for (auto *course: _courses) {
        delete course;
    }
}
*/

bool Student::add_course(int course_id, std::string course_name){
    if(_current_number_of_courses == _max_number_of_courses){
        std::cout << "Student cannot enroll in more courses \n";
        return false;
    }

    for (size_t i = 0; i < _current_number_of_courses; i++){
        if(_courses[i]->_course_id == course_id){
            std::cout << "Course already added :" << _courses[i]->_course_id << "\n";
            return false;
        }
    }

    if(course_id == -1){
        throw std::logic_error("Invalid course");
    }

    Course *new_course = new Course(course_id, course_name);
    std::cout << "Course being added: " << new_course->_course_id << "\n";

    // Add course
    _courses.push_back(new_course);

    // Bump up the course count
    _current_number_of_courses += 1;
    return true;
}

bool Student::drop_course(int course_id){
    if(course_id == -1){
        throw std::logic_error("Invalid course");
    }

    size_t i = 0;
    while (i < _current_number_of_courses) {
        if (_courses[i]->_course_id == course_id) {
            break;
        }
        i++;
    }

    if (i == _current_number_of_courses) {
        std::cout << "Course doesn't exist :" << course_id << "\n";
        return false;
    }

    _courses.erase(_courses.begin() + i);
    // delete _courses[_current_number_of_courses - 1];
    // _courses.pop_back();
    _current_number_of_courses--;
    return true;
}

std::ostream& operator <<(std::ostream& os, const Student& student)
{
    os << "Student :: " << student._student_id << " - " << student._student_name << "\n";

    // Print courses
    for (size_t i = 0; i < student._current_number_of_courses; i++){
        os << student._courses[i];
    }

    return os;
}

//////////////////////////////////////////////////////////////////////////////
///// UNDERGRAD STUDENT CLASS
//////////////////////////////////////////////////////////////////////////////

UndergradStudent::UndergradStudent(int student_id, std::string student_name, int year_in_program)
    : Student(student_id, student_name),
    _year_in_program(year_in_program){        
}

std::ostream& operator <<(std::ostream& os, const UndergradStudent& student)
{
    // Call base class operator first
    os << static_cast<const Student &>(student); 
    os << "Year in Program :: " << student._year_in_program << "\n";
    return os;
}

//////////////////////////////////////////////////////////////////////////////
///// GRAD STUDENT CLASS
//////////////////////////////////////////////////////////////////////////////

GraduateStudent::GraduateStudent(int student_id, std::string student_name, int advisor_id)
    :Student(student_id, student_name),
    _advisor_id(advisor_id){        
}

std::ostream& operator <<(std::ostream& os, const GraduateStudent& student)
{
    // Call base class operator first
    os << static_cast<const Student &>(student); 
    os << "Advisor :: " << student._advisor_id << "\n";
    return os;
}


}
}