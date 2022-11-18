# BuzzDB Snippets: Reader Writer Latch

## Setup
Same setup instructions as BuzzDB

Dependencies

```
apt install bison flex
```

## Overview
This repository implements a sample Reader Writer Latch
on a simple table that holds registration record of
students. This implementation is only for an illustration
of when Reader Writer latches are used and why certain 
software design choices are made.

Student record schema:

```
+--------------+---------------+--------------+
| student_id   | student_name  | courses      |
+--------------+---------------+--------------+
```

Course schema:

```
+--------------+---------------+
| course_id    | course_name   |
+--------------+---------------+
```

Source code:
```
buzzdb-snippets/src/include/rw_latches
buzzdb-snippets/src/rw_latches
```

## Usage
This snippet illustrates how to leverage Reader Writer Latch
with parallel processing to manage student record
```cpp
void simulate_add_100_students_with_10_threads() {
    // Initialize a table of records.
    StudentDB records = StudentDB();
    
    // Multiple threads
    std::vector<std::thread> threads;
    
    for (int i = 0; i < 10; i++) { // Enumerate over 10 threads.
        threads.emplace_back([&db, i] {
            for (int j = 0; j < 10; j++) { // Each thread adds 10 students.
                int new_course_id = (i * 100) + j; // Custom course id for illustration.
                db.add_student_course(1, new_course_id, "course_name"); // Add a student.
            }
        });
    }

    // Join threads and run.
    for (auto& thread : threads) {
        thread.join();
    }
}
```
