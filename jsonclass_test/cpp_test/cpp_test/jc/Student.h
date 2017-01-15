#ifndef __Student__
#define __Student__

#include <stdio.h>
#include <string>
#include <vector>
#include "cJSON.h"

class Name;

class Student
{
	public:
	bool gender;
	char number;
	short age;
	int grade;
	long level;
	float height;
	double weight;
	Name* name;
	std::vector<bool> testBools;
	std::vector<long> testInts;
	std::vector<float> testFloats;
	std::vector<std::string> testStrings;

	static Student* jsonObjectWithCJSON(cJSON* node);
	static Student* jsonObject(char* jsonString);
	cJSON* jsonRepresentation();
	char* jsonString();
};

#endif