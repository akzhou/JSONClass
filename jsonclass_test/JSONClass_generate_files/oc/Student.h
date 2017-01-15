#import <Foundation/Foundation.h>

@class Name;

@interface Student : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL gender;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger grade;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) double weight;
@property (nonatomic, strong) Name *name;
@property (nonatomic, strong) NSArray *testBools;
@property (nonatomic, strong) NSArray *testInts;
@property (nonatomic, strong) NSArray *testFloats;
@property (nonatomic, strong) NSArray *testStrings;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end