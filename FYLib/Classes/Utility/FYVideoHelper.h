//
//  FYVideoHelper.h
//  FFKit
//
//  Created by fan on 17/3/14.
//  Copyright © 2017年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface FYVideoHelper : NSObject

+ (void)tailorVideo:(NSString*)path exportPath:(NSString*)exportPath size:(CGSize)size transform:(CGAffineTransform)transform completion:(void(^)(NSError* error))completionBlock;


@end
