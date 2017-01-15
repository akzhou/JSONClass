#include "SignInReq.h"

SignInReq* SignInReq::jsonObjectWithCJSON(cJSON* node)
{
	cJSON* usernameNode = cJSON_GetObjectItem(node, "username");
	if (!usernameNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* passwordNode = cJSON_GetObjectItem(node, "password");
	if (!passwordNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}

	SignInReq* obj = new SignInReq();
	obj->username = usernameNode->valuestring;
	obj->password = passwordNode->valuestring;
	return obj;
}

SignInReq* SignInReq::jsonObject(char* jsonString)
{
    cJSON* node = cJSON_Parse(jsonString);
    if (!node)
    {
        printf("Error before: [%s]\n", cJSON_GetErrorPtr());
        return NULL;
    }
	SignInReq* obj =  SignInReq::jsonObjectWithCJSON(node);
	cJSON_Delete(node);
    return obj;
}

cJSON* SignInReq::jsonRepresentation()
{
	cJSON* node = cJSON_CreateObject();
	cJSON_AddStringToObject(node, "username",this->username.c_str());
	cJSON_AddStringToObject(node, "password",this->password.c_str());
	return node;
}

char* SignInReq::jsonString()
{
    cJSON* node = this->jsonRepresentation();
    char* str = cJSON_PrintUnformatted(node);
    cJSON_Delete(node);
    return str;
}
