//
//  NSNumber+FYAdd.m
//  FFKit
//
//  Created by fan on 16/7/9.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "NSNumber+FYAdd.h"

@implementation NSNumber (FYAdd)


- (NSNumber*)intIncreame {
    return [self intIncreate:1];
}

- (NSNumber*)intIncreate:(NSInteger)value {
    return @([self integerValue] + value);
}

- (NSNumber *)floatIncreame {
    return [self floatIncreame:1];
}

- (NSNumber *)floatIncreame:(float)value {
    return @([self floatValue] + value);
}
@end
