#include "Name.h"

Name* Name::jsonObjectWithCJSON(cJSON* node)
{
	cJSON* firstNameNode = cJSON_GetObjectItem(node, "firstName");
	if (!firstNameNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* lastNameNode = cJSON_GetObjectItem(node, "lastName");
	if (!lastNameNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}

	Name* obj = new Name();
	obj->firstName = firstNameNode->valuestring;
	obj->lastName = lastNameNode->valuestring;
	return obj;
}

Name* Name::jsonObject(char* jsonString)
{
    cJSON* node = cJSON_Parse(jsonString);
    if (!node)
    {
        printf("Error before: [%s]\n", cJSON_GetErrorPtr());
        return NULL;
    }
	Name* obj =  Name::jsonObjectWithCJSON(node);
	cJSON_Delete(node);
    return obj;
}

cJSON* Name::jsonRepresentation()
{
	cJSON* node = cJSON_CreateObject();
	cJSON_AddStringToObject(node, "firstName",this->firstName.c_str());
	cJSON_AddStringToObject(node, "lastName",this->lastName.c_str());
	return node;
}

char* Name::jsonString()
{
    cJSON* node = this->jsonRepresentation();
    char* str = cJSON_PrintUnformatted(node);
    cJSON_Delete(node);
    return str;
}
