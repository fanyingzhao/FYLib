//
//  UIViewController+FYAdd.h
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FYAdd)

/**
 导航栏背景色
 */
@property (nonatomic, strong) UIColor* navBarColor;

+ (UIViewController*)getActivityViewController;

//*************************
// UI
//*************************
- (void)setNavRightItemWithImage:(UIImage*)image
                        selector:(SEL)selector;
- (void)setNavRightItemWithImage:(UIImage*)image
                       highImage:(UIImage*)highImage
                        selector:(SEL)selector;

- (void)setNavRightItemWithTitle:(NSString*)title
                        selector:(SEL)selector;
- (void)setNavRightItemWithTitle:(NSString*)title
                     normalColor:(UIColor*)normalColor
                       highColor:(UIColor*)highColor
                        selector:(SEL)selector;
- (void)setNavRightItemWithTitle:(NSString*)title
                     normalColor:(UIColor*)normalColor
                       highColor:(UIColor*)highColor
                            font:(UIFont*)font
                        selector:(SEL)selector;

- (void)setNavItemTitleView:(UIView*)titleView;


/**
 设置默认返回按钮

 @param selector 返回按钮点击方法，如果为nil，则导航栏返回上一级
 */
- (void)setNavLeftItemBack:(SEL)selector;
- (void)setNavLeftItemWithImage:(UIImage*)image
                       selector:(SEL)selector;
- (void)setNavLeftItemWithImage:(UIImage*)image
                      hihgImage:(UIImage*)highImage
                       selector:(SEL)selector;
- (void)setNavLeftItemWithTitle:(NSString*)title
                        selector:(SEL)selector;
- (void)setNavLeftItemWithTitle:(NSString*)title
                     normalColor:(UIColor*)normalColor
                       highColor:(UIColor*)highColor
                        selector:(SEL)selector;
- (void)setNavLeftItemWithTitle:(NSString*)title
                     normalColor:(UIColor*)normalColor
                       highColor:(UIColor*)highColor
                            font:(UIFont*)font
                        selector:(SEL)selector;

@end
