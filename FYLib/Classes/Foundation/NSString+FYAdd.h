//
//  NSString+FYAdd.h
//  FFKit
//
//  Created by fan on 16/7/9.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (FYAdd)

/**
 *  过滤非法字符
 *
 *  @param illegalStr 非法字符合集字符串
 *
 *  @return 过滤后通过 "" 拼接的字符
 */
- (NSString*)filterIllegalCharacter:(NSString*)illegalStr;

/**
 *  过滤非法字符
 *
 *  @param illegalStr 非法字符合集
 *  @param joinStr    连接字符
 *
 *  @return 过滤并连接后的字符串
 */
- (NSString*)filterIllegalCharacter:(NSString*)illegalStr joinStr:(NSString*)joinStr;

/**
 *  md516,32位加密
 *
 *  @return 加密后的字符串
 */
- (NSString*)md5With16Encoder;
- (NSString*)md5With32Encoder;

/**
 *  md5 16位加密后的文件名，相比普通加密，增加了文件的后缀（如果有）
 *
 *  @return 加密后的文件名
 */
- (NSString*)md5EncoderFilename;

/**
 *  判断字符串是否有效
 *
 *  @return 是否有效
 */
- (BOOL)isValid;

/**
 裁剪出文件路径的最后一部分
 
 http://eye-love-you.oss-cn-shanghai.aliyuncs.com/test/hat.zip
 return hat.zip

 @return 最后一部分的路径
 */
- (NSString*)cutLastCommpoentPath;


/**
 根据当前时间戳，生成唯一文件名

 @return 文件名
 */
+ (NSString*)generateUniqueName;

+ (NSString*) generateUUIDString;


/**
 计算字符串的高度
 
 @param size 需要的size,例如CGSizeMaek(320, 0)
 @param font 字体
 @return 大小
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font;

/**
 删除字符串首尾的空格

 @return 格式化后的字符串
 */
- (NSString*)formatString;
@end
