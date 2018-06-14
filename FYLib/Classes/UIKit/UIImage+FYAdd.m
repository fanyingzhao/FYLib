//
//  UIImage+FYAdd.m
//  FFKit
//
//  Created by fan on 16/7/12.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "UIImage+FYAdd.h"
#import "NSString+FYAdd.h"
#import "NSFileManager+FYAdd.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "FYMacro.h"

@implementation UIImage (FYAdd)

- (UIImage *)reSizeImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
}

- (UIImage *)changeShapeWithCornerRadius:(CGFloat)radius {
    return [self changeShapeWithCornerRadius:radius size:self.size];
}

- (UIImage *)changeShapeWithCornerRadius:(CGFloat)radius size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context, CGRectGetWidth(rect) / 2, CGRectGetHeight(rect) / 2, radius, 0, 2 * M_PI, YES);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, rect, self.CGImage);
    
    return UIGraphicsGetImageFromCurrentImageContext();
}

- (UIImage *)changeImageContentWithSize:(CGRect)rect transform:(CGAffineTransform)transform {
    CGSize newSize = self.size;
    UIGraphicsBeginImageContext(newSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, newSize.width / 2, newSize.height / 2);
    CGContextConcatCTM(context, transform);
    CGContextTranslateCTM(context, newSize.width / -2, newSize.height / -2);
    
    [self drawInRect:CGRectMake(-rect.origin.x, -rect.origin.y, self.size.width * self.scale, self.size.height * self.scale)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)clipImageWithRect:(CGRect)rect scale:(CGFloat)scale orientation:(UIImageOrientation)orientation {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage* image = [UIImage imageWithCGImage:imageRef scale:scale orientation:orientation];

    CGImageRelease(imageRef);
    
    return image;
}

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (BOOL)saveToFile:(NSString *)fileName path:(NSString *)path md5:(BOOL)encryption {
    if (encryption) {
        fileName = [fileName md5With16Encoder];
    }
    
    if (![path isValid]) {
        path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"images"];
    }
    
    NSError *error = nil;
    BOOL res = [NSFileManager createDirectoryWithPath:path error:&error];
    if (!res) {
        FYLog(@"创建目录失败: %@",error);
        return NO;
    }
    
    error = nil;
    NSData *dataForPNGFile = UIImagePNGRepresentation(self);
    if (![dataForPNGFile writeToFile:[path stringByAppendingPathComponent:fileName] options:NSAtomicWrite error:&error]) {
        FYLog(@"保存图片失败：%@",error);
        return NO;
    }
    
    return YES;
}

+ (NSArray *)getImageListByGif:(NSString *)gifPath {
    NSMutableArray* array = [NSMutableArray array];
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:gifPath]];
    if (!data.length) {
        FYLog(@"No animated GIF data supplied.");
        return nil;
    }
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data,
                                                               (__bridge CFDictionaryRef)@{(__bridge NSString *)kCGImageSourceShouldCache: @NO});
    if (!imageSource) {
        FYLog(@"Failed to `CGImageSourceCreateWithData` for animated GIF data");
        return nil;
    }
    
    CFStringRef imageSourceContainerType = CGImageSourceGetType(imageSource);
    BOOL isGIFData = UTTypeConformsTo(imageSourceContainerType, kUTTypeGIF);
    if (!isGIFData) {
        FYLog(@"Supplied data is of type %@ and doesn't seem to be GIF data", imageSourceContainerType);
        return nil;
    }
    
    size_t imageCount = CGImageSourceGetCount(imageSource);
    for (size_t i = 0; i < imageCount; i++) {
        @autoreleasepool {
            CGImageRef frameImageRef = CGImageSourceCreateImageAtIndex(imageSource, i, NULL);
            if (frameImageRef) {
                UIImage *frameImage = [UIImage imageWithCGImage:frameImageRef];
                [array addObject:frameImage];
                CFRelease(frameImageRef);
            }
        }
    }
    
    return array.copy;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
