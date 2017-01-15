package java_test;

import java.util.ArrayList;

import jc.ClassRoom;
import jc.Name;
import jc.Student;

import com.google.gson.Gson;

public class JavaTest {

	public static void main(String[] args) {

		JavaTest obj = new JavaTest();
		ClassRoom classRoom = obj.createClassRoom();
		System.out.printf("classRoom object:%s\n", classRoom);

		String jsonString = obj.marshal(classRoom);
		System.out.printf("marshal result:%s\n", jsonString);

		ClassRoom classRoom2 = obj.unmarshal(jsonString);
		System.out.printf("unmarshal result:%s\n", classRoom2);

	}

	public ClassRoom createClassRoom() {
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
		
		ArrayList<Boolean> testBools = new ArrayList<Boolean>();
		testBools.add(new Boolean(true));
		testBools.add(new Boolean(false));
		testBools.add(new Boolean(true));
		student1.testBools = testBools;
		
		ArrayList<Long> testInts = new ArrayList<Long>();
		testInts.add(new Long(1));
		testInts.add(new Long(2));
		testInts.add(new Long(5));
		testInts.add(new Long(10));
		testInts.add(new Long(12));
		student1.testInts = testInts;
		
		ArrayList<Float> testFloats = new ArrayList<Float>();
		testFloats.add(new Float(2.0));
		testFloats.add(new Float(3.2));
		student1.testFloats = testFloats;
		
		ArrayList<String> testStrings = new ArrayList<String>();
		testStrings.add("HI");
		testStrings.add("Bye");
		student1.testStrings = testStrings;
		

		//student2
		Student student2 = new Student();
		student2.gender = true;
		student2.number = 101;
		student2.age = 18;
		student2.grade = 6;
		student2.level = 1;
		
		student2.height = 180.2f;
		student2.weight = 70.0;
		
		Name name2 = new Name();
		name2.firstName = "Steve";
		name2.lastName = "Jobs";
		student2.name = name2;
		
		testBools.clear();
		testBools.add(new Boolean(true));
		testBools.add(new Boolean(false));
		testBools.add(new Boolean(true));
		student2.testBools = testBools;
		
		testInts.clear();
		testInts.add(new Long(1));
		testInts.add(new Long(2));
		testInts.add(new Long(5));
		testInts.add(new Long(10));
		testInts.add(new Long(12));
		student2.testInts = testInts;
		
		testFloats.clear();
		testFloats.add(new Float(2.0));
		testFloats.add(new Float(3.2));
		student2.testFloats = testFloats;
		
		testStrings.clear();
		testStrings.add("Hello");
		testStrings.add("Bye");
		student2.testStrings = testStrings;
		

		ArrayList<Student> students = new ArrayList<Student>();
		students.add(student1);
		students.add(student2);
		
		ClassRoom classRoom = new ClassRoom();
		classRoom.students = students;
		return classRoom;
	}

	public String marshal(ClassRoom classRoom) {

		Gson gson = new Gson();
		return gson.toJson(classRoom);
	}

	public ClassRoom unmarshal(String jsonString) {

		Gson gson = new Gson();
		return gson.fromJson(jsonString, ClassRoom.class);
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
                "HI",
                "Bye"
            ]
        }
    ]
}

 */
