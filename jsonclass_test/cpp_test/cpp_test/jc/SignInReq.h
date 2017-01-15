#ifndef __SignInReq__
#define __SignInReq__

#include <stdio.h>
#include <string>
#include <vector>
#include "cJSON.h"

class SignInReq
{
	public:
	std::string username;
	std::string password;

	static SignInReq* jsonObjectWithCJSON(cJSON* node);
	static SignInReq* jsonObject(char* jsonString);
	cJSON* jsonRepresentation();
	char* jsonString();
};

#endif