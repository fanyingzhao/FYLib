//
//  FYUtility.m
//  FFKit
//
//  Created by fan on 16/12/1.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "FYUtility.h"

#define FIRST_USE       @"first_use"

void runOnMainQueue(void (^block)(void)) {
    if ([NSThread isMainThread]) {
        block();
    }
    else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

float getRunCosttime(void (^block)(void), bool isPrint) {
    CFAbsoluteTime elapsedTime, startTime = CFAbsoluteTimeGetCurrent();
    if (block) {
        block();
    }
    elapsedTime = CFAbsoluteTimeGetCurrent() - startTime;
    return elapsedTime * 1000.0;
}

@implementation FYUtility

+ (BOOL)checkIsFirstUse {
    BOOL res = [[NSUserDefaults standardUserDefaults] boolForKey:FIRST_USE];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:FIRST_USE];
    
    return !res;
}

+ (void)convertTimeToTimeStr:(NSUInteger)time complete:(void (^)(NSUInteger, NSUInteger, NSUInteger))complete {
    NSUInteger hour = time / 3600;
    NSUInteger min = time / 60;
    NSUInteger sec = time % 60;
    
    if (complete) {
        complete(hour, min, sec);
    }
}
@end
