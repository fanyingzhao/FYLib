//
//  NSDate+FYAdd.h
//  TaskManager
//
//  Created by fan on 16/9/28.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FYAdd)

- (NSDate*)fy_mutalbeCopy;

- (NSDateComponents*)getDateComponents;

/**
 将日期格式化为字符串

 @param format 格式化样式 (yyyy-MM-dd HH:mm:ss)
 @return 格式化后的字符串
 */
- (NSString*)getFormatDateWithFormat:(NSString*)format;

@end
