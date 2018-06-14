//
//  FYSaveHelper.m
//  FFKit
//
//  Created by fan on 16/12/22.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "FYSaveHelper.h"

@implementation FYSaveHelper

+ (instancetype)sharedInstance {
    static FYSaveHelper* fy_saveHelperInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fy_saveHelperInstance = [[FYSaveHelper alloc] init];
    });
    return fy_saveHelperInstance;
}



@end
