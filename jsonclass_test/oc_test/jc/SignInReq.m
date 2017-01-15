#import "SignInReq.h"

NSString *const k_SIGNINREQ_USERNAME = @"username";
NSString *const k_SIGNINREQ_PASSWORD = @"password";

@interface SignInReq ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SignInReq

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]]) {

		self.username = [self objectOrNilForKey:k_SIGNINREQ_USERNAME fromDictionary:dict];
		self.password = [self objectOrNilForKey:k_SIGNINREQ_PASSWORD fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.username forKey:k_SIGNINREQ_USERNAME];
	[mutableDict setValue:self.password forKey:k_SIGNINREQ_PASSWORD];
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
	self.username = [aDecoder decodeObjectForKey:k_SIGNINREQ_USERNAME];
	self.password = [aDecoder decodeObjectForKey:k_SIGNINREQ_PASSWORD];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_username forKey:k_SIGNINREQ_USERNAME];
	[aCoder encodeObject:_password forKey:k_SIGNINREQ_PASSWORD];
}

- (id)copyWithZone:(NSZone *)zone
{
	SignInReq *copy = [[SignInReq alloc] init];
	if (copy) {
		copy.username = [self.username copyWithZone:zone];
		copy.password = [self.password copyWithZone:zone];
	}
	return copy;
}
@end