//
//  FYNotification.m
//  MyPlane
//
//  Created by fan on 16/8/8.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "FYNotification.h"
#import "FYNotification.h"

#define LocalNotificationUserInfo   @"userInfo"
@interface FYNotification () {

}

@end

@implementation FYNotification

#pragma mark - funcs
+ (instancetype)sharedNotification {
    static FYNotification* fy_notificationInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        fy_notificationInstance = [[FYNotification alloc] init];
    });
    return fy_notificationInstance;
}

+ (UILocalNotification*)createLocalNotification:(NSString *)key alertBody:(NSString *)alertBody fireDate:(NSDate *)fireDate userInfo:(NSDictionary *)userDic {
    // 参数验证
    NSAssert(alertBody, @"通知内容为空");
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:userDic];
    [dic setValue:key forKey:LocalNotificationUserInfo];

    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireDate;
    notification.alertBody = alertBody;
    notification.userInfo = dic;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.alertAction = @"alertAction";
    notification.alertTitle = @"alertTitle";
    return notification;
}

- (void)registerLocalNotification:(UILocalNotification *)notification {
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

+ (UILocalNotification *)queryLocalNotification:(NSString *)key {
    __block UILocalNotification* noti = nil;
    NSArray* localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    [localNotifications enumerateObjectsUsingBlock:^(UILocalNotification*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[obj.userInfo objectForKey:LocalNotificationUserInfo] isEqualToString:key]) {
            noti = obj;
            *stop = YES;
        }
    }];
    
    return noti;
}

+ (void)cancleLocalNotification:(NSString *)key {
    [[UIApplication sharedApplication] cancelLocalNotification:[FYNotification queryLocalNotification:key]];
}

#pragma mark - tools

#pragma mark - getter

@end