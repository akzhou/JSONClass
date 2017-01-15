#import <Foundation/Foundation.h>

@interface Name : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end