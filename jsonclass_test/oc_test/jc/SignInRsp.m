#import "SignInRsp.h"
#import "ClassRoom.h"

NSString *const k_SIGNINRSP_CODE = @"code";
NSString *const k_SIGNINRSP_MSG = @"msg";
NSString *const k_SIGNINRSP_CLASSROOM = @"classRoom";

@interface SignInRsp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SignInRsp

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self && [dict isKindOfClass:[NSDictionary class]]) {

		self.code = [[self objectOrNilForKey:k_SIGNINRSP_CODE fromDictionary:dict] integerValue];
		self.msg = [self objectOrNilForKey:k_SIGNINRSP_MSG fromDictionary:dict];
		self.classRoom = [ClassRoom modelObjectWithDictionary:[dict objectForKey:k_SIGNINRSP_CLASSROOM]];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[NSNumber numberWithInteger:self.code] forKey:k_SIGNINRSP_CODE];
	[mutableDict setValue:self.msg forKey:k_SIGNINRSP_MSG];
	[mutableDict setValue:[self.classRoom dictionaryRepresentation] forKey:k_SIGNINRSP_CLASSROOM];
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
	self.code = [aDecoder decodeInt64ForKey:k_SIGNINRSP_CODE];
	self.msg = [aDecoder decodeObjectForKey:k_SIGNINRSP_MSG];
	self.classRoom = [aDecoder decodeObjectForKey:k_SIGNINRSP_CLASSROOM];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeInt64:_code forKey:k_SIGNINRSP_CODE];
	[aCoder encodeObject:_msg forKey:k_SIGNINRSP_MSG];
	[aCoder encodeObject:_classRoom forKey:k_SIGNINRSP_CLASSROOM];
}

- (id)copyWithZone:(NSZone *)zone
{
	SignInRsp *copy = [[SignInRsp alloc] init];
	if (copy) {
		copy.code = self.code;
		copy.msg = [self.msg copyWithZone:zone];
		copy.classRoom = [self.classRoom copyWithZone:zone];
	}
	return copy;
}
@end