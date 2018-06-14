//
//  QuartzHelper.h
//  BeautyPupil
//
//  Created by fan on 16/9/27.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QuartzHelper : NSObject

/**
 *  画圆角矩形
 *
 *  @param context 上下文
 *  @param frame   frame
 *  @param radius  圆角半径
 */
void drawRoundRectangle(CGContextRef context, CGRect frame, float radius);

/**
 *  画三角形
 *
 *  @param context   上下文
 *  @param frame     frame
 *  @param direction 三角形朝向，0：上 1：左 2：右 3：下
 */
void drawTriangle(CGContextRef context, CGRect frame, int direction);

/**
 画扇形

 @param context 上下文
 @param radius 半径
 @param angle 角度
 @param color 颜色
 */
void drawSector(CGContextRef context, float radius, float angle, UIColor* color);



@end
