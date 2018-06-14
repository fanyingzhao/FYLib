//
//  QrCodeHelper.h
//  BeautyPupil
//
//  Created by fan on 16/12/13.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QrCodeHelper : NSObject


/**
 根据字符串生成图片，默认生成250.f 的图片

 @param qrString 字符串内容
 @return 生成的图片
 */
+ (UIImage*)createQRWithString:(NSString*)qrString;

/**
 根据字符串内容生成二维码

 @param qrString 字符串内容
 @param size 图片的宽度
 @return 生成的图片
 */
+ (UIImage*)createQRWithString:(NSString*)qrString size:(CGFloat)size;

@end
