#ifndef __ClassRoom__
#define __ClassRoom__

#include <stdio.h>
#include <string>
#include <vector>
#include "cJSON.h"

class Student;

class ClassRoom
{
	public:
	std::vector<Student*> students;

	static ClassRoom* jsonObjectWithCJSON(cJSON* node);
	static ClassRoom* jsonObject(char* jsonString);
	cJSON* jsonRepresentation();
	char* jsonString();
};

#endif