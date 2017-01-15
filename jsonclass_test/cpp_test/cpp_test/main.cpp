//
//  main.cpp
//  cpp_test
//
//  Created by ak on 1/14/17.
//  Copyright © 2017 ak. All rights reserved.
//

#include <iostream>
#include "ClassRoom.h"
#include "Student.h"
#include "Name.h"

ClassRoom* createClassRoom();
char* marshal(ClassRoom *classRoom);
ClassRoom* unmarshal(char* jsonString);

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    ClassRoom *classRoom = createClassRoom();
    std::cout <<"classRoom object:"<< classRoom <<"\n";
    
    char *jsonString = marshal(classRoom);
    std::cout <<"marshal result:"<< jsonString << "\n";
    
    ClassRoom *classRoom2 = unmarshal(jsonString);
    std::cout <<"unmarshal result:"<< classRoom2 <<"\n";
    
    return 0;
}

ClassRoom* createClassRoom() {

    //student1
    Student *student1 = new Student();
    student1->gender = true;
    student1->number = 101;
    student1->age = 18;
    student1->grade = 6;
    student1->level = 1;
    student1->height = 180.2;
    student1->weight = 70.0;
    
    Name *name1 = new Name();
    name1->firstName = "Steve";
    name1->lastName = "Jobs";
    student1->name = name1;
    
    std::vector<bool> testBools;
    testBools.push_back(true);
    testBools.push_back(false);
    testBools.push_back(true);
    student1->testBools = testBools;
    
    std::vector<long> testInts;
    testInts.push_back(1);
    testInts.push_back(2);
    testInts.push_back(5);
    testInts.push_back(10);
    testInts.push_back(12);
    student1->testInts = testInts;
    
    std::vector<float> testFloats;
    testFloats.push_back(2.0);
    testFloats.push_back(3.2);
    student1->testFloats = testFloats;
    
    std::vector<std::string> testStrings;
    testStrings.push_back("Hello");
    testStrings.push_back("Bye");
    student1->testStrings = testStrings;
    
    //student2
    //student1
    Student *student2 = new Student();
    student2->gender = true;
    student2->number = 102;
    student2->age = 19;
    student2->grade = 6;
    student2->level = 1;
    student2->height = 180.21;
    student2->weight = 70.02;
    
    Name *name2 = new Name();
    name2->firstName = "Bill";
    name2->lastName = "Gates";
    student2->name = name2;
    
    testBools.clear();
    testBools.push_back(true);
    testBools.push_back(false);
    testBools.push_back(true);
    student2->testBools = testBools;
    
    testInts.clear();
    testInts.push_back(1);
    testInts.push_back(20);
    testInts.push_back(5);
    testInts.push_back(120);
    testInts.push_back(12);
    student2->testInts = testInts;
    
    testFloats.clear();
    testFloats.push_back(21.0);
    testFloats.push_back(3.2);
    student2->testFloats = testFloats;
    
    testStrings.clear();
    testStrings.push_back("HI");
    testStrings.push_back("Bye");
    student2->testStrings = testStrings;
    
    ClassRoom *classRoom = new ClassRoom();
    std::vector<Student *> students;
    students.push_back(student1);
    students.push_back(student2);
    classRoom->students = students;
    
    return classRoom;
}

char* marshal(ClassRoom *classRoom) {

    char* jsonString = classRoom->jsonString();
    return jsonString;
}

ClassRoom* unmarshal(char* jsonString) {

    ClassRoom* classRoom = ClassRoom::jsonObject(jsonString);
    return classRoom;
}


/*
 
 {
     "students": [
         {
             "gender": true,
             "number": 101,
             "age": 18,
             "grade": 6,
             "level": 1,
             "height": 180.199997,
             "weight": 70,
             "name": {
                 "firstName": "Steve",
                 "lastName": "Jobs"
             },
             "testBools": [
                 true,
                 false,
                 true
             ],
             "testInts": [
                 1,
                 2,
                 5,
                 10,
                 12
             ],
             "testFloats": [
                 2,
                 3.2
             ],
             "testStrings": [
                 "Hello",
                 "Bye"
             ]
         },
         {
             "gender": true,
             "number": 102,
             "age": 19,
             "grade": 6,
             "level": 1,
             "height": 180.210007,
             "weight": 70.02,
             "name": {
                 "firstName": "Bill",
                 "lastName": "Gates"
             },
             "testBools": [
                 true,
                 false,
                 true
             ],
             "testInts": [
                 1,
                 20,
                 5,
                 120,
                 12
             ],
             "testFloats": [
                 21,
                 3.2
             ],
             "testStrings": [
                 "HI",
                 "Bye"
             ]
         }
     ]
 }
 
 
 */
