#ifndef __SignInRsp__
#define __SignInRsp__

#include <stdio.h>
#include <string>
#include <vector>
#include "cJSON.h"

class ClassRoom;

class SignInRsp
{
	public:
	char code;
	std::string msg;
	ClassRoom* classRoom;

	static SignInRsp* jsonObjectWithCJSON(cJSON* node);
	static SignInRsp* jsonObject(char* jsonString);
	cJSON* jsonRepresentation();
	char* jsonString();
};

#endif