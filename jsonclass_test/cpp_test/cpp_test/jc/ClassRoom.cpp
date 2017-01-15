#include "ClassRoom.h"
#include "Student.h"

ClassRoom* ClassRoom::jsonObjectWithCJSON(cJSON* node)
{
	cJSON* studentsNode = cJSON_GetObjectItem(node, "students");
	if (!studentsNode) {
		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
		return NULL;
	}
	std::vector<Student*> studentsVector;
	for (int i = 0; i < cJSON_GetArraySize(studentsNode); i++)
	{
		cJSON* itemNode = cJSON_GetArrayItem(studentsNode, i);
		if (!itemNode)
				{
            		printf("Error before: [%s]\n", cJSON_GetErrorPtr());
            		return NULL;
        		}
		Student* obj = Student::jsonObjectWithCJSON(itemNode);
		if (!obj) {
            return NULL;
        }
		studentsVector.push_back(obj);
	}

	ClassRoom* obj = new ClassRoom();
	obj->students = studentsVector;
	return obj;
}

ClassRoom* ClassRoom::jsonObject(char* jsonString)
{
    cJSON* node = cJSON_Parse(jsonString);
    if (!node)
    {
        printf("Error before: [%s]\n", cJSON_GetErrorPtr());
        return NULL;
    }
	ClassRoom* obj =  ClassRoom::jsonObjectWithCJSON(node);
	cJSON_Delete(node);
    return obj;
}

cJSON* ClassRoom::jsonRepresentation()
{
	cJSON* studentsArrayNode = cJSON_CreateArray();
	for (int i=0; i<this->students.size(); i++) {
		Student* obj = this->students[i];
		cJSON* objNode = obj->jsonRepresentation();
		cJSON_AddItemToArray(studentsArrayNode, objNode);
	}
	cJSON* node = cJSON_CreateObject();
	cJSON_AddItemToObject(node, "students", studentsArrayNode);
	return node;
}

char* ClassRoom::jsonString()
{
    cJSON* node = this->jsonRepresentation();
    char* str = cJSON_PrintUnformatted(node);
    cJSON_Delete(node);
    return str;
}
