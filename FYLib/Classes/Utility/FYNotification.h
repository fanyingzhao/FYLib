//
//  FYNotification.h
//  MyPlane
//
//  Created by fan on 16/8/8.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYNotification : NSObject {
    
}

+ (instancetype)sharedNotification;

+ (UILocalNotification*)createLocalNotification:(NSString*)key alertBody:(NSString*)alertBody fireDate:(NSDate*)fireDate userInfo:(NSDictionary*)userDic;

- (void)registerLocalNotification:(UILocalNotification*)notification;

+ (UILocalNotification*)queryLocalNotification:(NSString*)key;

+ (void)cancleLocalNotification:(NSString*)key;

// 角标


@end
