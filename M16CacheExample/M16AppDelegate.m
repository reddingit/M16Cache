//
//  M16AppDelegate.m
//  M16CacheExample
//
//  Created by Redding on 14-8-13.
//  Copyright (c) 2014年 M16. All rights reserved.
//

#import "M16AppDelegate.h"

#import "M16PermanentCache.h"
#import "M16TimedCache.h"


NSString * const M16CommonKey = @"M16CommonKey";
NSString * const M16ImageKey = @"M16ImageKey";
NSString * const M16OneDayKey = @"M16OneDayKey";
NSString * const M16ThreeDaysKey = @"M16ThreeDaysKey";
NSString * const M16SevenDaysKey = @"M16SevenDaysKey";


@implementation M16AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self testM16Cache];
    
    return YES;
}
							
- (void)testM16Cache
{
    NSArray *values = @[@"M16PermanentCache", @"M16TimedCache"];
    
    M16PermanentCache *commonCache = [M16PermanentCache cacheWithType:M16PermanentCacheTypeCommon];
    
    [commonCache setObject:values forKey:M16CommonKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set common cache, key:%@, object:%@", key, object);
    }];
    
    [commonCache objectForKey:M16CommonKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read common cache, key:%@, object:%@", key, object);
    }];
    
    
    
    M16PermanentCache *imageCache = [M16PermanentCache cacheWithType:M16PermanentCacheTypeImage];
    
    [imageCache setObject:[UIImage imageNamed:@"dog"] forKey:M16ImageKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set image cache, key:%@, object:%@", key, object);
    }];
    
    [imageCache objectForKey:M16ImageKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read image cache, key:%@, object:%@", key, object);
    }];
    
    
    M16TimedCache *oneDayCache = [M16TimedCache cacheWithType:M16TimedCacheTypeOneDay];
    
    [oneDayCache setObject:values forKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set one day cache, key:%@, object:%@", key, object);
    }];
    
    [oneDayCache objectForKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read one day cache, key:%@, object:%@", key, object);
    }];
    
    
    
    M16TimedCache *threeDaysCache = [M16TimedCache cacheWithType:M16TimedCacheTypeThreeDays];
    
    [threeDaysCache setObject:values forKey:M16ThreeDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set three days cache, key:%@, object:%@", key, object);
    }];
    
    [threeDaysCache objectForKey:M16ThreeDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read three days cache, key:%@, object:%@", key, object);
    }];
    
    
    
    
    M16TimedCache *sevenDaysCache = [M16TimedCache cacheWithType:M16TimedCacheTypeSevenDays];
    
    [sevenDaysCache setObject:values forKey:M16SevenDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set seven days cache, key:%@, object:%@", key, object);
    }];
    
    [sevenDaysCache objectForKey:M16SevenDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read seven days cache, key:%@, object:%@", key, object);
    }];
    
}


@end
