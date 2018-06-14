//
//  FYMath.m
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "FYMath.h"

@implementation FYMath

+ (float)randomWithMin:(NSInteger)min max:(NSInteger)max {
    NSInteger difference = max - min;
    
    int res = arc4random() % (difference + 1);
    
    return res + min;
}

GLKMatrix4 convertGLKMatrix(float* matrix) {
    GLKMatrix4 m = {matrix[0], matrix[1], matrix[2], matrix[3],
                    matrix[4], matrix[5], matrix[6], matrix[7],
                    matrix[8], matrix[9], matrix[10], matrix[11],
                    matrix[12], matrix[13], matrix[14], matrix[15]};
    return m;
}

void getCircleInfo(CGPoint point1, CGPoint point2, CGPoint point3, CGPoint* centerPoint, float* radius) {
    double mat1,mat2,mat3 ;
    mat1 = ((point2.x * point2.x + point2.y * point2.y) - (point1.x * point1.x + point1.y * point1.y)) * (2 * (point3.y - point1.y)) -
    ((point3.x * point3.x + point3.y * point3.y) - (point1.x * point1.x + point1.y * point1.y)) * (2 * (point2.y - point1.y));
    mat2 = (2 * (point2.x - point1.x)) * ((point3.x * point3.x + point3.y * point3.y) - (point1.x * point1.x + point1.y * point1.y)) -
    (2 * (point3.x - point1.x)) * ((point2.x * point2.x + point2.y * point2.y) - (point1.x * point1.x + point1.y * point1.y));
    mat3 = 4 * ((point2.x - point1.x) * (point3.y - point1.y) - (point3.x - point1.x) * (point2.y - point1.y));
    
    *centerPoint = CGPointMake(mat1/mat3, mat2/mat3);
    *radius = sqrt((double)((point1.x - (*centerPoint).x) * (point1.x - (*centerPoint).x) +
                            (point1.y - (*centerPoint).y) * (point1.y - (*centerPoint).y)));
}

float getCirclePosition(CGPoint centerPoint, float radius, float x, bool isUp) {
    CGFloat y = -1;
    if (isUp) {
        y = -sqrt(radius * radius - (x - centerPoint.x) * (x - centerPoint.x)) + centerPoint.y;
    }else {
        y = sqrt(radius * radius - (x - centerPoint.x) * (x - centerPoint.x)) + centerPoint.y;
    }
    if (isnan(y)) {
        y = -1;
    }
    return y;
}

float getCircleRotation(CGPoint centerPoint, float radius, float x) {
    return asin((x - centerPoint.x) / radius);
}

@end
