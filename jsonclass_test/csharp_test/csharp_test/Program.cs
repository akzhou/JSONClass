using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using jc;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace csharp_test
{
    class Program
    {
        static void Main(string[] args)
        {
            
            ClassRoom classRoom = createClassRoom();
            Console.WriteLine("classRoom object:",classRoom);

            string jsonString = marshal(classRoom);
            Console.Write("marshal result:");
            Console.WriteLine(jsonString);

            ClassRoom classRoom2 = unmarshal(jsonString);
            Console.Write("marshal result:");
            Console.WriteLine(classRoom2);
        }

        static ClassRoom createClassRoom()
        {
            //student1
            Student student1 = new Student();
            student1.gender = true;
            student1.number = 101;
            student1.age = 18;
            student1.grade = 6;
            student1.level = 1;

            student1.height = 180.2f;
            student1.weight = 70.0;

            Name name1 = new Name();
            name1.firstName = "Steve";
            name1.lastName = "Jobs";
            student1.name = name1;

            List<bool> testBools = new List<bool>();
            testBools.Add(true);
            testBools.Add(false);
            testBools.Add(true);
            student1.testBools = testBools;

            List<long> testInts = new List<long>();
            testInts.Add(1);
            testInts.Add(2);
            testInts.Add(5);
            testInts.Add(10);
            testInts.Add(12);
            student1.testInts = testInts;

            List<float> testFloats = new List<float>();
            testFloats.Add(2.0f);
            testFloats.Add(3.2f);
            student1.testFloats = testFloats;

            List<string> testStrings = new List<string>();
            testStrings.Add("Hello");
            testStrings.Add("Bye");
            student1.testStrings = testStrings;

            //student2
            Student student2 = new Student();
            student2.gender = true;
            student2.number = 102;
            student2.age = 19;
            student2.grade = 6;
            student2.level = 1;

            student2.height = 180.21f;
            student2.weight = 70.02;

            Name name2 = new Name();
            name2.firstName = "Bill";
            name2.lastName = "Gates";
            student2.name = name2;

            testBools.Clear();
            testBools.Add(true);
            testBools.Add(false);
            testBools.Add(true);
            student2.testBools = testBools;

            testInts.Clear();
            testInts.Add(1);
            testInts.Add(20);
            testInts.Add(5);
            testInts.Add(120);
            testInts.Add(12);
            student2.testInts = testInts;

            testFloats.Clear();
            testFloats.Add(21.0f);
            testFloats.Add(3.2f);
            student2.testFloats = testFloats;

            testStrings.Clear();
            testStrings.Add("HI");
            testStrings.Add("Bye");
            student2.testStrings = testStrings;

            ClassRoom classRoom = new ClassRoom();
            List<Student> students = new List<Student>();
            students.Add(student1);
            students.Add(student2);
            classRoom.students = students;


            return classRoom;
        }

        static string marshal(ClassRoom classRoom) {

            string jsonString = JsonConvert.SerializeObject(classRoom);
            return jsonString;
        }


        static ClassRoom unmarshal(string jsonString)
        {

            ClassRoom classRoom = JsonConvert.DeserializeObject<ClassRoom>(jsonString);
            return classRoom;
        }
    }
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
