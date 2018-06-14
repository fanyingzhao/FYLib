//
//  UIView+FYAnimation.h
//  FFKit
//
//  Created by fan on 17/3/6.
//  Copyright © 2017年 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYAnimation)

- (instancetype)fadeIn;
- (instancetype)fadeOut;

- (instancetype)stop;
- (instancetype)animate;

@end
