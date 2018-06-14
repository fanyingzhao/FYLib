//
//  UIView+FYAdd.m
//  FFKit
//
//  Created by fan on 16/6/29.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "UIView+FYAdd.h"

@implementation UIView (FYAdd)


- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.bounds.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.bounds.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.bounds.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.bounds.size.height;
    self.frame = frame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGRect frame = self.frame;
    frame.origin.x = centerX - self.bounds.size.width / 2;
    self.frame = frame;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGRect frame = self.frame;
    frame.origin.y = centerY - self.bounds.size.height / 2;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.bounds;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.bounds.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)fy_sizeToFit:(NSInteger)option position:(NSInteger)position {
    CGRect originRect = self.frame;
    CGRect rect = self.frame;
    
    [self sizeToFit];
    switch (option) {
        case 0: {
            rect.size = self.bounds.size;
        }
            break;
        case 1: {
            rect.size.height = originRect.size.height;
            rect.size.width = self.self.width;
            if ([self isKindOfClass:[UIImageView class]]) {
                rect.size.width = CGRectGetHeight(rect) * (self.size.width / self.size.height);
            }
        }
            break;
        case 2: {
            rect.size.width = originRect.size.width;
            rect.size.height = self.size.height;
            if ([self isKindOfClass:[UIImageView class]]) {
                rect.size.height = CGRectGetWidth(rect) / (self.size.width / self.size.height);
            }
        }
            break;
        default:
            break;
    }
    
    switch (position) {
        case 0: {
            
        }
            break;
        case 1: {
            rect.origin.x = originRect.origin.x + (rect.origin.x + rect.size.width / 2 - originRect.origin.x - originRect.size.width / 2);
        }
            break;
        case 2: {
            rect.origin.x = originRect.origin.x + originRect.size.width - rect.size.width;
        }
            break;
        case 3: {
            rect.origin.y = originRect.origin.y + (rect.origin.y + rect.size.height / 2 - originRect.origin.y + originRect.size.height / 2);
        }
            break;
        case 4: {
            rect.origin.x = originRect.origin.x + (rect.origin.x + rect.size.width / 2 - originRect.origin.x - originRect.size.width / 2);
            rect.origin.y = originRect.origin.y + (rect.origin.y + rect.size.height / 2 - originRect.origin.y - originRect.size.height / 2);
        }
            break;
        case 5: {
            rect.origin.x = originRect.origin.x + originRect.size.width - rect.size.width;
            rect.origin.y = originRect.origin.y + (rect.origin.y + rect.size.height / 2 - originRect.origin.y + originRect.size.height / 2);
        }
            break;
        case 6: {
            rect.origin.y = originRect.origin.y + originRect.size.height - rect.size.height;
        }
            break;
        case 7: {
            rect.origin.x = originRect.origin.x + (rect.origin.x + rect.size.width / 2 - originRect.origin.x - originRect.size.width / 2);
            rect.origin.y = originRect.origin.y + originRect.size.height - rect.size.height;
        }
            break;
        case 8: {
            rect.origin.x = originRect.origin.x + originRect.size.width - rect.size.width;
            rect.origin.y = originRect.origin.y + originRect.size.height - rect.size.height;
        }
            break;
            
        default:
            break;
    }
    
    self.frame = rect;
}

- (CGRect)convertRectToScreen {
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    return [self convertRect:self.bounds toView:window];
}

- (UIView*)duplicateView {
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

- (UIWindow *)fy_getKeyWindow {
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    return window;
}

- (void)snap:(void (^)(UIImage *))complete {
    UIView* bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [[self fy_getKeyWindow] addSubview:bgView];
    [UIView animateWithDuration:0.4 animations:^{
        bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [bgView removeFromSuperview];
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        complete(image);
    }];
}

@end
