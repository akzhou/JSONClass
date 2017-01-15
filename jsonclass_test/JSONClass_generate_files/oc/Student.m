#import "Student.h"
#import "Name.h"

NSString *const k_STUDENT_GENDER = @"gender";
NSString *const k_STUDENT_NUMBER = @"number";
NSString *const k_STUDENT_AGE = @"age";
NSString *const k_STUDENT_GRADE = @"grade";
NSString *const k_STUDENT_LEVEL = @"level";
NSString *const k_STUDENT_HEIGHT = @"height";
NSString *const k_STUDENT_WEIGHT = @"weight";
NSString *const k_STUDENT_NAME = @"name";
NSString *const k_STUDENT_TESTBOOLS = @"testBools";
NSString *const k_STUDENT_TESTINTS = @"testInts";
NSString *const k_STUDENT_TESTFLOATS = @"testFloats";
NSString *const k_STUDENT_TESTSTRINGS = @"testStrings";

@interface Student ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Student

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]]) {

		self.gender = [[self objectOrNilForKey:k_STUDENT_GENDER fromDictionary:dict] boolValue];
		self.number = [[self objectOrNilForKey:k_STUDENT_NUMBER fromDictionary:dict] integerValue];
		self.age = [[self objectOrNilForKey:k_STUDENT_AGE fromDictionary:dict] integerValue];
		self.grade = [[self objectOrNilForKey:k_STUDENT_GRADE fromDictionary:dict] integerValue];
		self.level = [[self objectOrNilForKey:k_STUDENT_LEVEL fromDictionary:dict] integerValue];
		self.height = [[self objectOrNilForKey:k_STUDENT_HEIGHT fromDictionary:dict] floatValue];
		self.weight = [[self objectOrNilForKey:k_STUDENT_WEIGHT fromDictionary:dict] doubleValue];
		self.name = [Name modelObjectWithDictionary:[dict objectForKey:k_STUDENT_NAME]];

		NSObject *testBoolsReceived = [dict objectForKey:k_STUDENT_TESTBOOLS];
		NSMutableArray *testBoolsParsed = [NSMutableArray array];
		if ([testBoolsReceived isKindOfClass:[NSArray class]]) {
			for (id item in (NSArray *)testBoolsReceived) {
					[testBoolsParsed addObject:item];
			}
		}
		self.testBools = [NSArray arrayWithArray:testBoolsParsed];

		NSObject *testIntsReceived = [dict objectForKey:k_STUDENT_TESTINTS];
		NSMutableArray *testIntsParsed = [NSMutableArray array];
		if ([testIntsReceived isKindOfClass:[NSArray class]]) {
			for (id item in (NSArray *)testIntsReceived) {
					[testIntsParsed addObject:item];
			}
		}
		self.testInts = [NSArray arrayWithArray:testIntsParsed];

		NSObject *testFloatsReceived = [dict objectForKey:k_STUDENT_TESTFLOATS];
		NSMutableArray *testFloatsParsed = [NSMutableArray array];
		if ([testFloatsReceived isKindOfClass:[NSArray class]]) {
			for (id item in (NSArray *)testFloatsReceived) {
					[testFloatsParsed addObject:item];
			}
		}
		self.testFloats = [NSArray arrayWithArray:testFloatsParsed];

		NSObject *testStringsReceived = [dict objectForKey:k_STUDENT_TESTSTRINGS];
		NSMutableArray *testStringsParsed = [NSMutableArray array];
		if ([testStringsReceived isKindOfClass:[NSArray class]]) {
			for (id item in (NSArray *)testStringsReceived) {
					[testStringsParsed addObject:item];
			}
		}
		self.testStrings = [NSArray arrayWithArray:testStringsParsed];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[NSNumber numberWithBool:self.gender] forKey:k_STUDENT_GENDER];
	[mutableDict setValue:[NSNumber numberWithInteger:self.number] forKey:k_STUDENT_NUMBER];
	[mutableDict setValue:[NSNumber numberWithInteger:self.age] forKey:k_STUDENT_AGE];
	[mutableDict setValue:[NSNumber numberWithInteger:self.grade] forKey:k_STUDENT_GRADE];
	[mutableDict setValue:[NSNumber numberWithInteger:self.level] forKey:k_STUDENT_LEVEL];
	[mutableDict setValue:[NSNumber numberWithFloat:self.height] forKey:k_STUDENT_HEIGHT];
	[mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:k_STUDENT_WEIGHT];
	[mutableDict setValue:[self.name dictionaryRepresentation] forKey:k_STUDENT_NAME];
	NSMutableArray *testBoolsTempItems = [NSMutableArray array];
	for (NSObject *obj in self.testBools) {
		if([obj respondsToSelector:@selector(dictionaryRepresentation)]) {
			[testBoolsTempItems addObject:[obj performSelector:@selector(dictionaryRepresentation)]];
		} else {
			[testBoolsTempItems addObject:obj];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:testBoolsTempItems] forKey:k_STUDENT_TESTBOOLS];
	NSMutableArray *testIntsTempItems = [NSMutableArray array];
	for (NSObject *obj in self.testInts) {
		if([obj respondsToSelector:@selector(dictionaryRepresentation)]) {
			[testIntsTempItems addObject:[obj performSelector:@selector(dictionaryRepresentation)]];
		} else {
			[testIntsTempItems addObject:obj];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:testIntsTempItems] forKey:k_STUDENT_TESTINTS];
	NSMutableArray *testFloatsTempItems = [NSMutableArray array];
	for (NSObject *obj in self.testFloats) {
		if([obj respondsToSelector:@selector(dictionaryRepresentation)]) {
			[testFloatsTempItems addObject:[obj performSelector:@selector(dictionaryRepresentation)]];
		} else {
			[testFloatsTempItems addObject:obj];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:testFloatsTempItems] forKey:k_STUDENT_TESTFLOATS];
	NSMutableArray *testStringsTempItems = [NSMutableArray array];
	for (NSObject *obj in self.testStrings) {
		if([obj respondsToSelector:@selector(dictionaryRepresentation)]) {
			[testStringsTempItems addObject:[obj performSelector:@selector(dictionaryRepresentation)]];
		} else {
			[testStringsTempItems addObject:obj];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:testStringsTempItems] forKey:k_STUDENT_TESTSTRINGS];
	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
	self.gender = [aDecoder decodeBoolForKey:k_STUDENT_GENDER];
	self.number = [aDecoder decodeInt64ForKey:k_STUDENT_NUMBER];
	self.age = [aDecoder decodeInt64ForKey:k_STUDENT_AGE];
	self.grade = [aDecoder decodeInt64ForKey:k_STUDENT_GRADE];
	self.level = [aDecoder decodeInt64ForKey:k_STUDENT_LEVEL];
	self.height = [aDecoder decodeFloatForKey:k_STUDENT_HEIGHT];
	self.weight = [aDecoder decodeDoubleForKey:k_STUDENT_WEIGHT];
	self.name = [aDecoder decodeObjectForKey:k_STUDENT_NAME];
	self.testBools = [aDecoder decodeObjectForKey:k_STUDENT_TESTBOOLS];
	self.testInts = [aDecoder decodeObjectForKey:k_STUDENT_TESTINTS];
	self.testFloats = [aDecoder decodeObjectForKey:k_STUDENT_TESTFLOATS];
	self.testStrings = [aDecoder decodeObjectForKey:k_STUDENT_TESTSTRINGS];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeBool:_gender forKey:k_STUDENT_GENDER];
	[aCoder encodeInt64:_number forKey:k_STUDENT_NUMBER];
	[aCoder encodeInt64:_age forKey:k_STUDENT_AGE];
	[aCoder encodeInt64:_grade forKey:k_STUDENT_GRADE];
	[aCoder encodeInt64:_level forKey:k_STUDENT_LEVEL];
	[aCoder encodeFloat:_height forKey:k_STUDENT_HEIGHT];
	[aCoder encodeDouble:_weight forKey:k_STUDENT_WEIGHT];
	[aCoder encodeObject:_name forKey:k_STUDENT_NAME];
	[aCoder encodeObject:_testBools forKey:k_STUDENT_TESTBOOLS];
	[aCoder encodeObject:_testInts forKey:k_STUDENT_TESTINTS];
	[aCoder encodeObject:_testFloats forKey:k_STUDENT_TESTFLOATS];
	[aCoder encodeObject:_testStrings forKey:k_STUDENT_TESTSTRINGS];
}

- (id)copyWithZone:(NSZone *)zone
{
	Student *copy = [[Student alloc] init];
	if (copy) {
		copy.gender = self.gender;
		copy.number = self.number;
		copy.age = self.age;
		copy.grade = self.grade;
		copy.level = self.level;
		copy.height = self.height;
		copy.weight = self.weight;
		copy.name = [self.name copyWithZone:zone];
		copy.testBools = [self.testBools copyWithZone:zone];
		copy.testInts = [self.testInts copyWithZone:zone];
		copy.testFloats = [self.testFloats copyWithZone:zone];
		copy.testStrings = [self.testStrings copyWithZone:zone];
	}
	return copy;
}
@end