#ifndef __Name__
#define __Name__

#include <stdio.h>
#include <string>
#include <vector>
#include "cJSON.h"

class Name
{
	public:
	std::string firstName;
	std::string lastName;

	static Name* jsonObjectWithCJSON(cJSON* node);
	static Name* jsonObject(char* jsonString);
	cJSON* jsonRepresentation();
	char* jsonString();
};

#endif