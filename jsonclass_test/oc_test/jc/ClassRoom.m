#import "ClassRoom.h"
#import "Student.h"

NSString *const k_CLASSROOM_STUDENTS = @"students";

@interface ClassRoom ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClassRoom

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]]) {


		NSObject *studentsReceived = [dict objectForKey:k_CLASSROOM_STUDENTS];
		NSMutableArray *studentsParsed = [NSMutableArray array];
		if ([studentsReceived isKindOfClass:[NSArray class]]) {
			for (id item in (NSArray *)studentsReceived) {
				if ([item isKindOfClass:[NSDictionary class]]) {
					[studentsParsed addObject:[Student modelObjectWithDictionary:item]];
				}
			}
		}
		self.students = [NSArray arrayWithArray:studentsParsed];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	NSMutableArray *studentsTempItems = [NSMutableArray array];
	for (NSObject *obj in self.students) {
		if([obj respondsToSelector:@selector(dictionaryRepresentation)]) {
			[studentsTempItems addObject:[obj performSelector:@selector(dictionaryRepresentation)]];
		} else {
			[studentsTempItems addObject:obj];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:studentsTempItems] forKey:k_CLASSROOM_STUDENTS];
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
	self.students = [aDecoder decodeObjectForKey:k_CLASSROOM_STUDENTS];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_students forKey:k_CLASSROOM_STUDENTS];
}

- (id)copyWithZone:(NSZone *)zone
{
	ClassRoom *copy = [[ClassRoom alloc] init];
	if (copy) {
		copy.students = [self.students copyWithZone:zone];
	}
	return copy;
}
@end