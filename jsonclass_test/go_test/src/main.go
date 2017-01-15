package main

import (
	"encoding/json"
	"fmt"
	"jc"
)

func main() {

	var classRoom jc.ClassRoom = createClassRoom()
	fmt.Println("classRoom object:", classRoom)

	var jsonString = marshal(classRoom)
	fmt.Println("marshal result:", jsonString)

	var classRoom2 jc.ClassRoom = unmarshal(jsonString)
	fmt.Println("unmarshal result:", classRoom2)

}

func createClassRoom() (classRoom jc.ClassRoom) {

	//student1
	var student1 jc.Student
	student1.Gender = true //male
	student1.Number = 101
	student1.Age = 18
	student1.Grade = 6
	student1.Level = 1

	student1.Height = 180.2
	student1.Weight = 70.0

	var name1 jc.Name
	name1.FirstName = "Steve"
	name1.LastName = "Jobs"
	student1.Name = name1

	student1.TestBools = []bool{true, false, true}
	student1.TestInts = []int64{1, 2, 5, 10, 12}
	student1.TestFloats = []float32{2.0, 3.2}
	student1.TestStrings = []string{"Hello", "Bye"}

	//student2
	var student2 jc.Student
	student2.Gender = true //male
	student2.Number = 102
	student2.Age = 19
	student2.Grade = 6
	student2.Level = 1

	student2.Height = 180.21
	student2.Weight = 70.02

	var name2 jc.Name
	name2.FirstName = "Bill"
	name2.LastName = "Gates"
	student2.Name = name2

	student2.TestBools = []bool{true, false, true}
	student2.TestInts = []int64{1, 20, 5, 120, 12}
	student2.TestFloats = []float32{21.0, 3.2}
	student2.TestStrings = []string{"HI", "Bye"}

	classRoom.Students = []jc.Student{student1, student2}

	return classRoom
}

//object -> jsonString
func marshal(classRoom jc.ClassRoom) (jsonString string) {

	ret, err := json.Marshal(classRoom)
	if err != nil {
		fmt.Println(err)
	}
	jsonString = string(ret)

	return jsonString
}

//jsonString -> object
func unmarshal(jsonString string) (classRoom jc.ClassRoom) {

	err := json.Unmarshal([]byte(jsonString), &classRoom)
	if err != nil {
		fmt.Println(err)
	}

	return classRoom
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
            "height": 180.2,
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
            "height": 180.21,
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
