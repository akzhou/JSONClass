#import <Foundation/Foundation.h>

@class Student;

@interface ClassRoom : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *students;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end