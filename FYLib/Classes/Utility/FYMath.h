//
//  FYMath.h
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

#import "FYKit.h"

FY_EXTERN_C_BEGIN

@interface FYMath : NSObject

/**
 *  得到min 和 max 之间的一个随机数
 *
 *  @param min 最小值
 *  @param max 最大值
 *
 *  @return 随机值
 */
+ (float)randomWithMin:(NSInteger)min max:(NSInteger)max;

/**
 *  转换float 到 GLKMatrix4
 *
 *  @param float float指针
 *
 *  @return 转换后的GLKMatrix4
 */
GLKMatrix4 convertGLKMatrix(float *);

/**
 *  根据三个点得到圆的中心点和半径
 *
 *  @param point1      第一个点
 *  @param point2      第二个点
 *  @param point3      第三个点
 *  @param centerPoint 中心店
 *  @param radius      半径
 */
void getCircleInfo(CGPoint point1, CGPoint point2, CGPoint point3, CGPoint* centerPoint, float* radius);

/**
 *  根据x 点位置得到对应圆上的y 点，如果该点不在圆上，y点为 -1
 *
 *  @param centerPoint 圆的中心点
 *  @param radius      半径
 *  @param x           横坐标
 *  @param isUp        是否是上半圆
 *  @param position    该点的位置
 */
float getCirclePosition(CGPoint centerPoint, float radius, float x, bool isUp);

/**
 *  根据横坐标x 得到旋转的角度
 *
 *  @param centerPoint 圆的中心点
 *  @param radius      半径
 *  @param x           横坐标
 *
 *  @return 对应的角度
 */
float getCircleRotation(CGPoint centerPoint, float radius, float x);


@end


FY_EXTERN_C_END