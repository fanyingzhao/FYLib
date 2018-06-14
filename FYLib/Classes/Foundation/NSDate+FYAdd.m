//
//  NSDate+FYAdd.m
//  TaskManager
//
//  Created by fan on 16/9/28.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "NSDate+FYAdd.h"

@implementation NSDate (FYAdd)

- (NSDate *)fy_mutalbeCopy {
    NSDate* now = [NSDate date];
    NSTimeInterval interval = [self timeIntervalSinceDate:now];
    return [NSDate dateWithTimeInterval:interval sinceDate:now];
}

- (NSDateComponents *)getDateComponents {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:self];
    return comps;
}

- (NSString *)getFormatDateWithFormat:(NSString *)format {
    if (!format) {
        format = @"yyyy-MM-dd HH:mm:ss";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:self];
    return strDate;
}
@end
