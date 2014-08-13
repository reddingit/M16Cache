//
//  M16TimedCache.h
//  M16
//

#import "M16Cache.h"

typedef NS_ENUM(NSInteger, M16TimedCacheType) {
    M16TimedCacheTypeOneDay,    //缓存1天
    M16TimedCacheTypeThreeDays, //缓存3天
    M16TimedCacheTypeSevenDays, //缓存7天
};

@interface M16TimedCache : M16Cache

+ (instancetype)cacheWithType:(M16TimedCacheType)cacheType;

+ (instancetype)oneDayCache;
+ (instancetype)threeDaysCache;
+ (instancetype)sevenDaysCache;

@end
