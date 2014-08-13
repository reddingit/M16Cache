//
//  M16Cache.m
//  M16
//

#import "M16Cache.h"

@implementation M16Cache

- (TMCache *)tmCache
{
    return nil;
}

#pragma mark - Asynchronous Methods

- (void)objectForKey:(NSString *)key block:(TMCacheObjectBlock)block
{
    [[self tmCache] objectForKey:key block:block];
}

- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key block:(TMCacheObjectBlock)block
{
    [[self tmCache] setObject:object forKey:key block:block];
}

- (void)removeObjectForKey:(NSString *)key block:(TMCacheObjectBlock)block
{
    [[self tmCache] removeObjectForKey:key block:block];
}

- (void)removeAllObjects:(TMCacheBlock)block
{
    [[self tmCache] removeAllObjects:block];
}

#pragma mark - Synchronous Methods

- (id)objectForKey:(NSString *)key
{
    return [[self tmCache] objectForKey:key];
}

- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key
{
    [[self tmCache] setObject:object forKey:key];
}

- (void)removeObjectForKey:(NSString *)key
{
    [[self tmCache] removeObjectForKey:key];
}

- (void)removeAllObjects
{
    [[self tmCache] removeAllObjects];
}

@end
