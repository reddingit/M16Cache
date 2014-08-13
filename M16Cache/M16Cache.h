//
//  M16Cache.h
//  M16
//

#import "TMCache.h"

@interface M16Cache : NSObject

- (TMCache *)tmCache;

#pragma mark - Asynchronous Methods

- (void)objectForKey:(NSString *)key block:(TMCacheObjectBlock)block;

- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key block:(TMCacheObjectBlock)block;

- (void)removeObjectForKey:(NSString *)key block:(TMCacheObjectBlock)block;

- (void)removeAllObjects:(TMCacheBlock)block;

#pragma mark - Synchronous Methods

- (id)objectForKey:(NSString *)key;

- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key;

- (void)removeObjectForKey:(NSString *)key;

- (void)removeAllObjects;

@end
