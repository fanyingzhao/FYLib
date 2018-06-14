//
//  QuartzHelper.m
//  BeautyPupil
//
//  Created by fan on 16/9/27.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "QuartzHelper.h"

@implementation QuartzHelper

/**
 *  画圆角矩形
 *
 *  @param context 上下文
 *  @param frame   frame
 *  @param radius  圆角半径
 */
void drawRoundRectangle(CGContextRef context, CGRect frame, float radius) {
    float width = frame.size.width;
    float height = frame.size.height;
    float startX = frame.origin.x;
    float startY = frame.origin.y;
    
    CGContextMoveToPoint(context, startX + radius, startY);
    
    CGContextAddLineToPoint(context, startX + width - radius, startY);
    CGContextAddArc(context, startX + width - radius, radius + startY, radius, -0.5 * M_PI, 0.0, 0);
    
    CGContextAddLineToPoint(context, startX + width, height - radius + startY);
    CGContextAddArc(context, startX + width - radius, height - radius + startY, radius, 0.0, 0.5 * M_PI, 0);
    
    CGContextAddLineToPoint(context, startX + radius, height + startY);
    CGContextAddArc(context, startX + radius, height - radius + startY, radius, 0.5 * M_PI, M_PI, 0);
    
    CGContextAddLineToPoint(context, startX, radius + startY);
    CGContextAddArc(context, startX + radius, radius + startY, radius, M_PI, 1.5 * M_PI, 0);
    
    CGContextClosePath(context);
}

void drawTriangle(CGContextRef context, CGRect frame, int direction) {
    CGPoint point1 = CGPointZero;
    CGPoint point2 = CGPointZero;
    CGPoint point3 = CGPointZero;
    
    if (direction == 0) {
        point1 = CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame));
        point2 = CGPointMake(CGRectGetMaxX(frame), CGRectGetMaxY(frame));
        point3 = CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame));
    }else if (direction == 1) {
        
    }else if (direction == 2) {
        
    }else if (direction == 3) {
        
    }
    
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddLineToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    CGContextClosePath(context);
}

@end
