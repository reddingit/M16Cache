//
//  M16PermanentCache.m
//  M16
//

#import "M16PermanentCache.h"

NSString * const M16PermanentCacheTypeCommonKey = @"M16PermanentCacheTypeCommonKey";
NSString * const M16PermanentCacheTypeImageKey = @"M16PermanentCacheTypeImageKey";

static NSMutableDictionary *cacheInstanceDic = nil;


@interface M16PermanentCache ()

@property (nonatomic, strong) TMCache *cache;
@property (nonatomic, assign) M16PermanentCacheType cacheType;

@end

@implementation M16PermanentCache

+ (NSString *)cacheFolderNameWithType:(M16PermanentCacheType)cacheType
{
    NSString *name;
    
    switch (cacheType) {
        case M16PermanentCacheTypeCommon:
            name = M16PermanentCacheTypeCommonKey;
            
            break;
            
        case M16PermanentCacheTypeImage:
            name = M16PermanentCacheTypeImageKey;
            
            break;
            
        default:
            name = M16PermanentCacheTypeCommonKey;
            break;
    }
    
    return name;
}

+ (instancetype)cacheWithType:(M16PermanentCacheType)cacheType
{
    if (!cacheInstanceDic) {
        cacheInstanceDic = [NSMutableDictionary dictionary];
    }
    
    NSString *key = [M16PermanentCache cacheFolderNameWithType:cacheType];
    if (!cacheInstanceDic[key]) {
        cacheInstanceDic[key] = [[M16PermanentCache alloc] initWithType:cacheType];
    }
    
    return cacheInstanceDic[key];
}

+ (instancetype)defaultCache
{
    return [M16PermanentCache cacheWithType:M16PermanentCacheTypeCommon];
}

+(instancetype)imageCache
{
    return [M16PermanentCache cacheWithType:M16PermanentCacheTypeImage];
}

- (instancetype)initWithType:(M16PermanentCacheType)cacheType
{
    self = [self init];
    if (self) {
        self.cacheType = cacheType;
        self.cache = [[TMCache alloc] initWithName:[M16PermanentCache cacheFolderNameWithType:cacheType]];
    }
    
    return self;
}

- (TMCache *)tmCache
{
    return self.cache;
}

@end
