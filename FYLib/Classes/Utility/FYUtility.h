//
//  FYUtility.h
//  FFKit
//
//  Created by fan on 16/12/1.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>

void runOnMainQueue(void (^block)(void));

/**
 计算代码运行时间，单位ms

 @param block 要计算的代码
 @return 运行的时间
 */
float getRunCosttime(void (^block)(void), bool isPrint);

@interface FYUtility : NSObject

/**
 是否是第一次使用

 @return 是否是第一次使用
 */
+ (BOOL)checkIsFirstUse;

+ (void)convertTimeToTimeStr:(NSUInteger)time complete:(void (^)(NSUInteger hour, NSUInteger min, NSUInteger sec))complete;

@end
