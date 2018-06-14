//
//  UIViewController+FYAdd.m
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#define SYSTEM_NAVITEM_FONT     17

#import "UIViewController+FYAdd.h"
#import "UIButton+FYAdd.h"

@implementation UIViewController (FYAdd)
+ (UIViewController*)getActivityViewController {
    UIViewController* activityVC = nil;
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    NSArray* subViews = window.subviews;
    if (subViews.count) {
        id nextResponer = ((UIView*)subViews[0]).nextResponder;
        if ([nextResponer isKindOfClass:[UINavigationController class]]) {
            activityVC = ((UINavigationController*)nextResponer).visibleViewController;
        }else if ([nextResponer isKindOfClass:[UIViewController class]]) {
            activityVC = nextResponer;
        }else if ([nextResponer isKindOfClass:[UIWindow class]]) {
            activityVC = window.rootViewController.presentedViewController;
            if (!activityVC) {
                activityVC = window.rootViewController;
            }
        }else {
            activityVC = window.rootViewController;
        }
    }
    
    if ([activityVC isKindOfClass:[UINavigationController class]]) {
        activityVC = ((UINavigationController*)activityVC).visibleViewController;
    }
    
    return activityVC;
}

#pragma mark - status



#pragma mark - attribute


//*************************
// UI
//*************************
- (UIColor *)navBarColor {
    return self.navigationController.navigationBar.barTintColor;
}

- (void)setNavBarColor:(UIColor *)navBarColor {
    self.navigationController.navigationBar.barTintColor = navBarColor;
}

- (void)setNavRightItemWithImage:(UIImage *)image selector:(SEL)selector {
    [self setNavRightItemWithImage:image highImage:image selector:selector];
}

- (void)setNavRightItemWithImage:(UIImage *)image highImage:(UIImage *)highImage selector:(SEL)selector {
    UIButton* btn = [UIButton buttonWithImage:image highImage:highImage target:self selector:selector];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setNavRightItemWithTitle:(NSString *)title selector:(SEL)selector {
    [self setNavRightItemWithTitle:title normalColor:nil highColor:nil font:[UIFont systemFontOfSize:SYSTEM_NAVITEM_FONT] selector:selector];
}

- (void)setNavRightItemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor selector:(SEL)selector {
    [self setNavRightItemWithTitle:title normalColor:normalColor highColor:highColor font:[UIFont systemFontOfSize:SYSTEM_NAVITEM_FONT] selector:selector];
}

- (void)setNavRightItemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor font:(UIFont *)font selector:(SEL)selector {
    UIButton* btn = [UIButton buttonWithTitle:title normalColor:normalColor highColor:highColor font:font target:self selector:selector];
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setNavItemTitleView:(UIView *)titleView {
    [self.navigationItem setTitleView:titleView];
}

- (void)setNavLeftItemBack:(SEL)selector {
    if (!selector) {
        [self setNavLeftItemWithImage:[UIImage imageNamed:@"nav_back"] selector:@selector(_back:)];
        return ;
    }
    [self setNavLeftItemWithImage:[UIImage imageNamed:@"nav_back"] selector:selector];
}

- (void)setNavLeftItemWithImage:(UIImage *)image selector:(SEL)selector {
    [self setNavLeftItemWithImage:image hihgImage:nil selector:selector];
}

- (void)setNavLeftItemWithImage:(UIImage *)image hihgImage:(UIImage *)highImage selector:(SEL)selector {
    UIButton* btn = [UIButton buttonWithImage:image highImage:highImage target:self selector:selector];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setNavLeftItemWithTitle:(NSString *)title selector:(SEL)selector {
    [self setNavLeftItemWithTitle:title normalColor:nil highColor:nil font:[UIFont systemFontOfSize:SYSTEM_NAVITEM_FONT] selector:selector];
}

- (void)setNavLeftItemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor selector:(SEL)selector {
    [self setNavLeftItemWithTitle:title normalColor:normalColor highColor:highColor font:[UIFont systemFontOfSize:SYSTEM_NAVITEM_FONT] selector:selector];
}

- (void)setNavLeftItemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor font:(UIFont *)font selector:(SEL)selector {
    UIButton* btn = [UIButton buttonWithTitle:title normalColor:normalColor highColor:highColor font:font target:self selector:selector];
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}

#pragma mark - tools
- (void)_back:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
