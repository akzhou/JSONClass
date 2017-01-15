#include "Student.h"
#include "Name.h"

Student* Student::jsonObjectWithCJSON(cJSON* node)
{
	cJSON* genderNode = cJSON_GetObjectItem(node, "gender");
	if (!genderNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* numberNode = cJSON_GetObjectItem(node, "number");
	if (!numberNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* ageNode = cJSON_GetObjectItem(node, "age");
	if (!ageNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* gradeNode = cJSON_GetObjectItem(node, "grade");
	if (!gradeNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* levelNode = cJSON_GetObjectItem(node, "level");
	if (!levelNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* heightNode = cJSON_GetObjectItem(node, "height");
	if (!heightNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* weightNode = cJSON_GetObjectItem(node, "weight");
	if (!weightNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* nameNode = cJSON_GetObjectItem(node, "name");
	if (!nameNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	cJSON* testBoolsNode = cJSON_GetObjectItem(node, "testBools");
	if (!testBoolsNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	std::vector<bool> testBoolsVector;
	for (int i = 0; i < cJSON_GetArraySize(testBoolsNode); i++)
	{
		cJSON* itemNode = cJSON_GetArrayItem(testBoolsNode, i);
		if (!itemNode)
				{
            		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
            		return NULL;
        		}
		testBoolsVector.push_back(itemNode->valueint);
	}
	cJSON* testIntsNode = cJSON_GetObjectItem(node, "testInts");
	if (!testIntsNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	std::vector<long> testIntsVector;
	for (int i = 0; i < cJSON_GetArraySize(testIntsNode); i++)
	{
		cJSON* itemNode = cJSON_GetArrayItem(testIntsNode, i);
		if (!itemNode)
				{
            		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
            		return NULL;
        		}
		testIntsVector.push_back(itemNode->valueint);
	}
	cJSON* testFloatsNode = cJSON_GetObjectItem(node, "testFloats");
	if (!testFloatsNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	std::vector<float> testFloatsVector;
	for (int i = 0; i < cJSON_GetArraySize(testFloatsNode); i++)
	{
		cJSON* itemNode = cJSON_GetArrayItem(testFloatsNode, i);
		if (!itemNode)
				{
            		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
            		return NULL;
        		}
		testFloatsVector.push_back(itemNode->valuedouble);
	}
	cJSON* testStringsNode = cJSON_GetObjectItem(node, "testStrings");
	if (!testStringsNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	std::vector<std::string> testStringsVector;
	for (int i = 0; i < cJSON_GetArraySize(testStringsNode); i++)
	{
		cJSON* itemNode = cJSON_GetArrayItem(testStringsNode, i);
		if (!itemNode)
				{
            		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
            		return NULL;
        		}
		testStringsVector.push_back(itemNode->valuestring);
	}

	Student* obj = new Student();
	obj->gender = genderNode->valueint;
	obj->number = numberNode->valueint;
	obj->age = ageNode->valueint;
	obj->grade = gradeNode->valueint;
	obj->level = levelNode->valueint;
	obj->height = heightNode->valuedouble;
	obj->weight = weightNode->valuedouble;
	obj->name = Name::jsonObjectWithCJSON(nameNode);
	obj->testBools = testBoolsVector;
	obj->testInts = testIntsVector;
	obj->testFloats = testFloatsVector;
	obj->testStrings = testStringsVector;
	return obj;
}

Student* Student::jsonObject(char* jsonString)
{
    cJSON* node = cJSON_Parse(jsonString);
    if (!node)
    {
        printf("Error before: [%s]\n", cJSON_GetErrorPtr());
        return NULL;
    }
	Student* obj =  Student::jsonObjectWithCJSON(node);
	cJSON_Delete(node);
    return obj;
}

cJSON* Student::jsonRepresentation()
{
	cJSON* nameNode = this->name->jsonRepresentation();
	cJSON* testBoolsArrayNode = cJSON_CreateArray();
	for (int i=0; i<this->testBools.size(); i++) {
		bool obj = this->testBools[i];
		cJSON_AddItemToArray(testBoolsArrayNode, cJSON_CreateBool(obj));
	}
	cJSON* testIntsArrayNode = cJSON_CreateArray();
	for (int i=0; i<this->testInts.size(); i++) {
		long obj = this->testInts[i];
		cJSON_AddItemToArray(testIntsArrayNode, cJSON_CreateNumber(obj));
	}
	cJSON* testFloatsArrayNode = cJSON_CreateArray();
	for (int i=0; i<this->testFloats.size(); i++) {
		float obj = this->testFloats[i];
		cJSON_AddItemToArray(testFloatsArrayNode, cJSON_CreateNumber(obj));
	}
	cJSON* testStringsArrayNode = cJSON_CreateArray();
	for (int i=0; i<this->testStrings.size(); i++) {
		std::string obj = this->testStrings[i];
		cJSON_AddItemToArray(testStringsArrayNode, cJSON_CreateString(obj.c_str()));
	}
	cJSON* node = cJSON_CreateObject();
	cJSON_AddBoolToObject(node, "gender", this->gender);
	cJSON_AddNumberToObject(node, "number", this->number);
	cJSON_AddNumberToObject(node, "age", this->age);
	cJSON_AddNumberToObject(node, "grade", this->grade);
	cJSON_AddNumberToObject(node, "level", this->level);
	cJSON_AddNumberToObject(node, "height", this->height);
	cJSON_AddNumberToObject(node, "weight", this->weight);
	cJSON_AddItemToObject(node, "name", nameNode);
	cJSON_AddItemToObject(node, "testBools", testBoolsArrayNode);
	cJSON_AddItemToObject(node, "testInts", testIntsArrayNode);
	cJSON_AddItemToObject(node, "testFloats", testFloatsArrayNode);
	cJSON_AddItemToObject(node, "testStrings", testStringsArrayNode);
	return node;
}

char* Student::jsonString()
{
    cJSON* node = this->jsonRepresentation();
    char* str = cJSON_PrintUnformatted(node);
    cJSON_Delete(node);
    return str;
}
