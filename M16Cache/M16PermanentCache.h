//
//  M16PermanentCache.h
//  M16
//

#import "M16Cache.h"

typedef NS_ENUM(NSInteger, M16PermanentCacheType) {
    M16PermanentCacheTypeCommon,
    M16PermanentCacheTypeImage,
};

@interface M16PermanentCache : M16Cache

+ (instancetype)cacheWithType:(M16PermanentCacheType)cacheType;

+ (instancetype)defaultCache;
+ (instancetype)imageCache;

@end
