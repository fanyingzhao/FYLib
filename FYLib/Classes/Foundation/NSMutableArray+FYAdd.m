//
//  NSMutableArray+FYAdd.m
//  FFKit
//
//  Created by fan on 16/7/14.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "NSMutableArray+FYAdd.h"

typedef id (^WeakReference)(void);
@implementation NSMutableArray (FYAdd)

- (void)addWeakObject:(id)anObject {
    [self addObject:MakeWeakReference(anObject)];
}

- (id)weakObjectAtIndex:(NSInteger)index {
    if ([[self objectAtIndex:index] isMemberOfClass:[NSObject class]]) {
        return [self objectAtIndex:index];
    }
    return WeakReferenceNonretainedObjectValue([self objectAtIndex:index]);
}

- (void)clean {
    NSMutableArray* list = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!WeakReferenceNonretainedObjectValue(obj)) {
            [list addObject:@(idx)];
        }
    }];
    
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObjectAtIndex:idx];
    }];
}

- (void)addObjectNoRepeat:(NSObject *)object {
    if (![self containsObject:object]) {
        [self addObject:object];
    }
}

#pragma mark - tools
WeakReference MakeWeakReference (id object) {
    __weak id weakref = object;
    return ^{ return weakref; };
}
id WeakReferenceNonretainedObjectValue (WeakReference ref) {
    if (ref == nil)
        return nil;
    else
        return ref ();
}

@end
