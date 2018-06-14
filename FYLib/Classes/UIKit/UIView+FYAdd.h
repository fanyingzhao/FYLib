//
//  UIView+FYAdd.h
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYAdd)

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;


/**
 控件自适应

 @param option 
 * 0 : 宽高自适应
 * 1 : 宽度自适应，高度不变
 * 2 : 高度自适应，宽度不变
 
 @param position
 * 原图九个点的位置不变, 0 : 左上角， 1 ： 上边中点， 2 ： 右上角， 3 ： 左边中点， 4 ： 中心点 。。。
 *
 */
- (void)fy_sizeToFit:(NSInteger)option position:(NSInteger)position;

/**
 *  视图相对于屏幕的frame
 *
 *  @return frame
 */
- (CGRect)convertRectToScreen;

/**
 *  完全复制一个相同的view，有弊端，无法复制属性，一些子类无法复制
 *  重写 copyWithZone
 *
 *  @return 复制的view
 */
- (UIView*)duplicateView;

/**
 得到主window

 @return 主window
 */
- (UIWindow*)fy_getKeyWindow;

/**
 屏幕截图快照
 */
- (void)snap:(void (^)(UIImage* image))complete;

@end
