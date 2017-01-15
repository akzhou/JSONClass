#include "SignInRsp.h"
#include "ClassRoom.h"

SignInRsp* SignInRsp::jsonObjectWithCJSON(cJSON* node)
{
	cJSON* codeNode = cJSON_GetObjectItem(node, "code");
	if (!codeNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* msgNode = cJSON_GetObjectItem(node, "msg");
	if (!msgNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* classRoomNode = cJSON_GetObjectItem(node, "classRoom");
	if (!classRoomNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}

	SignInRsp* obj = new SignInRsp();
	obj->code = codeNode->valueint;
	obj->msg = msgNode->valuestring;
	obj->classRoom = ClassRoom::jsonObjectWithCJSON(classRoomNode);
	return obj;
}

SignInRsp* SignInRsp::jsonObject(char* jsonString)
{
    cJSON* node = cJSON_Parse(jsonString);
    if (!node)
    {
        printf("Error before: [%s]\n", cJSON_GetErrorPtr());
        return NULL;
    }
	SignInRsp* obj =  SignInRsp::jsonObjectWithCJSON(node);
	cJSON_Delete(node);
    return obj;
}

cJSON* SignInRsp::jsonRepresentation()
{
	cJSON* classRoomNode = this->classRoom->jsonRepresentation();
	cJSON* node = cJSON_CreateObject();
	cJSON_AddNumberToObject(node, "code", this->code);
	cJSON_AddStringToObject(node, "msg",this->msg.c_str());
	cJSON_AddItemToObject(node, "classRoom", classRoomNode);
	return node;
}

char* SignInRsp::jsonString()
{
    cJSON* node = this->jsonRepresentation();
    char* str = cJSON_PrintUnformatted(node);
    cJSON_Delete(node);
    return str;
}
