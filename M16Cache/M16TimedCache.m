//
//  M16TimedCache.m
//  M16
//

#import "M16TimedCache.h"

typedef NS_ENUM(long long, M16TimedCacheAgeLimit) {
    M16TimedCacheAgeLimitOneDay = 86400, //缓存秒数，1*24*60*60
    M16TimedCacheAgeLimitThreeDays = 259200, //缓存秒数，3*24*60*60
    M16TimedCacheAgeLimitSevenDays = 604800, //缓存秒数，7*24*60*60
};

NSString * const M16TimedCacheTypeOneDayKey = @"M16TimedCacheTypeOneDayKey";
NSString * const M16TimedCacheTypeThreeDaysKey = @"M16TimedCacheTypeThreeDaysKey";
NSString * const M16TimedCacheTypeSevenDaysKey = @"M16TimedCacheTypeSevenDaysKey";

static NSMutableDictionary *cacheInstanceDic = nil;

@interface M16TimedCache ()

@property (nonatomic, strong) TMCache *cache;
@property (nonatomic, assign) M16TimedCacheType cacheType;
@property (nonatomic, assign) NSTimeInterval cacheAgeLimit;

@end

@implementation M16TimedCache

+ (NSString *)cacheFolderNameWithType:(M16TimedCacheType)cacheType
{
    NSString *name;
    
    switch (cacheType) {
        case M16TimedCacheTypeOneDay:
            name = M16TimedCacheTypeOneDayKey;
            
            break;
            
        case M16TimedCacheTypeThreeDays:
            name = M16TimedCacheTypeThreeDaysKey;
            
            break;
            
        case M16TimedCacheTypeSevenDays:
            name = M16TimedCacheTypeSevenDaysKey;
            
            break;
    }
    
    return name;
}

+ (NSTimeInterval)cacheAgeLimitWithType:(M16TimedCacheType)cacheType
{
    NSTimeInterval ageLimit;
    
    switch (cacheType) {
        case M16TimedCacheTypeOneDay:
            ageLimit = M16TimedCacheAgeLimitOneDay;
            
            break;
            
        case M16TimedCacheTypeThreeDays:
            ageLimit = M16TimedCacheAgeLimitThreeDays;
            
            break;
            
        case M16TimedCacheTypeSevenDays:
            ageLimit = M16TimedCacheAgeLimitSevenDays;
            
            break;
    }
    
    return ageLimit;
}

+ (instancetype)cacheWithType:(M16TimedCacheType)cacheType
{
    if (!cacheInstanceDic) {
        cacheInstanceDic = [NSMutableDictionary dictionary];
    }
    
    NSString *key = [M16TimedCache cacheFolderNameWithType:cacheType];
    if (!cacheInstanceDic[key]) {
        cacheInstanceDic[key] = [[M16TimedCache alloc] initWithType:cacheType];
    }
    
    return cacheInstanceDic[key];
}

+ (instancetype)oneDayCache
{
    return [M16TimedCache cacheWithType:M16TimedCacheTypeOneDay];
}

+ (instancetype)threeDaysCache
{
    return [M16TimedCache cacheWithType:M16TimedCacheTypeThreeDays];
}

+ (instancetype)sevenDaysCache
{
    return [M16TimedCache cacheWithType:M16TimedCacheTypeSevenDays];
}

- (instancetype)initWithType:(M16TimedCacheType)cacheType
{
    self = [self init];
    if (self) {
        self.cacheType = cacheType;
        self.cache = [[TMCache alloc] initWithName:[M16TimedCache cacheFolderNameWithType:cacheType]];
        self.cache.diskCache.ageLimit = [M16TimedCache cacheAgeLimitWithType:cacheType];
    }
    
    return self;
}

- (TMCache *)tmCache
{
    return self.cache;
}

@end
