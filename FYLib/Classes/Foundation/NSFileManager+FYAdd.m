//
//  NSFileManager+FYAdd.m
//  FFKit
//
//  Created by fan on 16/7/6.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "NSFileManager+FYAdd.h"
#import "NSString+FYAdd.h"
#import "FYMacro.h"

@implementation NSFileManager (FYAdd)

+ (BOOL)createDirectoryWithPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        return [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    }
    return YES;
}

+ (unsigned long long)getFilesizeAtPath:(NSString *)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        NSError* error = nil;
        unsigned long long filesize = 0;
        filesize = [[manager attributesOfItemAtPath:filePath error:&error] fileSize];
        if (error) {
            FYLog(@"error -- (%@)",error);
        }
        
        return filesize;
    }
    
    return 0;
}

#pragma mark - tools


@end


