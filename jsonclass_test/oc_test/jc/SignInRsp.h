#import <Foundation/Foundation.h>

@class ClassRoom;

@interface SignInRsp : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) ClassRoom *classRoom;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end