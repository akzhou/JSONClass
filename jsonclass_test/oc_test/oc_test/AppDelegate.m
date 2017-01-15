//
//  AppDelegate.m
//  oc_test
//
//  Created by ak on 1/14/17.
//  Copyright © 2017 ak. All rights reserved.
//

#import "AppDelegate.h"
#import "ClassRoom.h"
#import "Student.h"
#import "Name.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ClassRoom *classRoom = [self createCleateClassRoom];
    NSLog(@"classRoom object:%@",classRoom);
    
    NSString *jsonString = [self marshal:classRoom];
    NSLog(@"marshal result:%@",jsonString);
    
    ClassRoom *classRoom2 = [self unmarshal:jsonString];
    NSLog(@"unmarshal result:%@",classRoom2);
    
    
    return YES;
}


- (ClassRoom *)createCleateClassRoom {
    
    //student1
    Student *student1 = [[Student alloc] init];
    student1.gender = true;
    student1.number = 101;
    student1.age = 18;
    student1.grade = 6;
    student1.level = 1;
    
    student1.height = 180.2;
    student1.weight = 70.0;
    
    Name *name1 = [[Name alloc] init];
    name1.firstName = @"Steve";
    name1.lastName = @"Jobs";
    student1.name = name1;
    
    student1.testBools = [[NSArray alloc] initWithObjects:@YES,@NO,@YES, nil];
    student1.testInts = [[NSArray alloc] initWithObjects:@1,@2,@5,@10,@12, nil];
    student1.testFloats = [[NSArray alloc] initWithObjects:@2.0,@3.2,nil];
    student1.testStrings = [[NSArray alloc] initWithObjects:@"Hello",@"Bye",nil];
    
    //student2
    Student *student2 = [[Student alloc] init];
    student2.gender = true;
    student2.number = 102;
    student2.age = 19;
    student2.grade = 6;
    student2.level = 1;
    
    student2.height = 180.21;
    student2.weight = 70.02;
    
    Name *name2 = [[Name alloc] init];
    name2.firstName = @"Bill";
    name2.lastName = @"Gates";
    student2.name = name2;
    
    student2.testBools = [[NSArray alloc] initWithObjects:@YES,@NO,@YES, nil];
    student2.testInts = [[NSArray alloc] initWithObjects:@1,@20,@5,@120,@12, nil];
    student2.testFloats = [[NSArray alloc] initWithObjects:@21.0,@3.2,nil];
    student2.testStrings = [[NSArray alloc] initWithObjects:@"HI",@"Bye",nil];
    
    
    
    ClassRoom *classRoom = [[ClassRoom alloc] init];
    classRoom.students = [[NSArray alloc] initWithObjects:student1,student2, nil];
    
    return classRoom;
}


- (NSString *)marshal:(ClassRoom *)classRoom {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:classRoom.dictionaryRepresentation options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return error.localizedDescription;
    }
    NSString *jsonString =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


- (ClassRoom *)unmarshal:(NSString *)jsonString {
    
    NSError *error;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error) {
        return nil;
    }
    ClassRoom *classRoom = [ClassRoom modelObjectWithDictionary:dict];
    return classRoom;
}



@end



/*
 
 {
 "students" : [
    {
        "testBools" : [
            true,
            false,
            true
        ],
        "age" : 18,
        "testInts" : [
            1,
            2,
            5,
            10,
            12
        ],
        "weight" : 70,
        "testStrings" : [
            "Hello",
            "Bye"
        ],
        "level" : 1,
        "testFloats" : [
            2,
            3.2
        ],
        "number" : 101,
        "height" : 180.2,
        "grade" : 6,
        "name" : {
            "firstName" : "Steve",
            "lastName" : "Jobs"
        },
        "gender" : true
    },
    {
        "testBools" : [
            true,
            false,
            true
        ],
        "age" : 19,
        "testInts" : [
            1,
            20,
            5,
            120,
            12
        ],
        "weight" : 70.02,
        "testStrings" : [
            "HI",
            "Bye"
        ],
        "level" : 1,
        "testFloats" : [
            21,
            3.2
        ],
        "number" : 102,
        "height" : 180.21,
        "grade" : 6,
        "name" : {
            "firstName" : "Bill",
            "lastName" : "Gates"
        },
        "gender" : true
    }
 ]
 }

 
 */
