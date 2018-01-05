#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface MSMWStock : NSObject
@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, strong) NSNumber *previousDayClose;
@property (nonatomic, strong) NSArray <NSNumber *> *dayData;
@end
NS_ASSUME_NONNULL_END
