# M16Cache

M16Cache is a wrapper on [**TMCache**](https://github.com/tumblr/TMCache)(Thanks for this excellent work!), store cache in different folder accroding to type and expired time.

Usage:

+ Using common cache:
```objc
  NSArray *values = @[@"M16PermanentCache", @"M16TimedCache"];
    
    M16PermanentCache *commonCache = [M16PermanentCache cacheWithType:M16PermanentCacheTypeCommon];
    
    [commonCache setObject:values forKey:M16CommonKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set common cache, key:%@, object:%@", key, object);
    }];
    
    [commonCache objectForKey:M16CommonKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read common cache, key:%@, object:%@", key, object);
    }];
```

+ Using image cache:
```objc
  M16PermanentCache *imageCache = [M16PermanentCache cacheWithType:M16PermanentCacheTypeImage];
    
    [imageCache setObject:[UIImage imageNamed:@"dog"] forKey:M16ImageKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set image cache, key:%@, object:%@", key, object);
    }];
    
    [imageCache objectForKey:M16ImageKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read image cache, key:%@, object:%@", key, object);
    }];
```
  
+ Using one day cache:
```objc
  M16TimedCache *oneDayCache = [M16TimedCache cacheWithType:M16TimedCacheTypeOneDay];
    
    [oneDayCache setObject:values forKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set one day cache, key:%@, object:%@", key, object);
    }];
    
    [oneDayCache objectForKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read one day cache, key:%@, object:%@", key, object);
    }];
```

+ Using three days cache:
```objc
  M16TimedCache *threeDaysCache = [M16TimedCache cacheWithType:M16TimedCacheTypeThreeDays];
    
    [threeDaysCache setObject:values forKey:M16ThreeDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set three days cache, key:%@, object:%@", key, object);
    }];
    
    [threeDaysCache objectForKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read three days cache, key:%@, object:%@", key, object);
    }];
```

+ Using seven days cache:
```objc
  M16TimedCache *sevenDaysCache = [M16TimedCache cacheWithType:M16TimedCacheTypeSevenDays];
    
    [sevenDaysCache setObject:values forKey:M16SevenDaysKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Set seven days cache, key:%@, object:%@", key, object);
    }];
    
    [sevenDaysCache objectForKey:M16OneDayKey block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"Read seven days cache, key:%@, object:%@", key, object);
    }];
```

## Installation

First install [**TMCache**](https://github.com/tumblr/TMCache), then drop *M16Cache* folder in your project.

## Author

Redding Yu, yl3016@126.com

## License

M16Cache is available under the MIT license. See the LICENSE file for more info.

