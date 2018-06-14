//
//  UIDevice+FYAdd.h
//  FFKit
//
//  Created by fan on 16/7/13.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (FYAdd)

/**
 *  获取当前设备可用内存
 *
 *  @return 单位 MB
 */
+ (double)availableMemory;

/**
 *  获取当前任务所占用的内存
 *
 *  @return 单位MB
 */
+ (double)usedMemory;

/**
 *  得到当前系统电量
 *
 *  @return 系统电量
 */
+ (int)getCurrentBatteryLevel;

/**
 *  系统总空间
 *
 *  @return 系统总空间
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  剩余空间
 *
 *  @return 剩余的空间
 */
+ (NSNumber *)freeDiskSpace;

@end
