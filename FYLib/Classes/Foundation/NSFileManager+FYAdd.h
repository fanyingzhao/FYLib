//
//  NSFileManager+FYAdd.h
//  FFKit
//
//  Created by fan on 16/7/6.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (FYAdd)

/**
 创建目录

 @param path 文件目录
 @param error 错误信息
 @return 是否创建成功
 */
+ (BOOL)createDirectoryWithPath:(NSString*)path error:(NSError**)error;

/**
 得到文件的大小

 @param filePath 文件路径
 @return 文件大小
 */
+ (unsigned long long)getFilesizeAtPath:(NSString*)filePath;

@end
