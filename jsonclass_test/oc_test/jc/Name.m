#import "Name.h"

NSString *const k_NAME_FIRSTNAME = @"firstName";
NSString *const k_NAME_LASTNAME = @"lastName";

@interface Name ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Name

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]]) {

		self.firstName = [self objectOrNilForKey:k_NAME_FIRSTNAME fromDictionary:dict];
		self.lastName = [self objectOrNilForKey:k_NAME_LASTNAME fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.firstName forKey:k_NAME_FIRSTNAME];
	[mutableDict setValue:self.lastName forKey:k_NAME_LASTNAME];
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
	self.firstName = [aDecoder decodeObjectForKey:k_NAME_FIRSTNAME];
	self.lastName = [aDecoder decodeObjectForKey:k_NAME_LASTNAME];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_firstName forKey:k_NAME_FIRSTNAME];
	[aCoder encodeObject:_lastName forKey:k_NAME_LASTNAME];
}

- (id)copyWithZone:(NSZone *)zone
{
	Name *copy = [[Name alloc] init];
	if (copy) {
		copy.firstName = [self.firstName copyWithZone:zone];
		copy.lastName = [self.lastName copyWithZone:zone];
	}
	return copy;
}
@end