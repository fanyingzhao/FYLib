//
//  FYAssertHandler.m
//  FFKit
//
//  Created by fan on 16/6/28.
//  Copyright © 2016年 fan. All rights reserved.
//

#import "FYAssertHandler.h"
#import "FYMacro.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation FYAssertHandler

+ (void)load
{
    [FYAssertHandler addMonitor];
}

// objective-c
- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format, ... {
    va_list arguments;
    NSString* eachObject;
    
    format = [NSString stringWithFormat:@"NSAssert Failure: <%@ %@ %li> %@",NSStringFromClass([object class]), NSStringFromSelector(selector), line, format];
    
    if (format)
    {
        va_start(arguments, format);
        
        while ((eachObject = va_arg(arguments, id))) {
            format = [format stringByAppendingString:[NSString stringWithFormat:@" %@",eachObject]];
        }
        va_end(arguments);
    }
    
    FYAlertMsg(format);
}

// c
- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format, ... {
    va_list arguments;
    NSString* eachObject;
    
    if (format)
    {
        va_start(arguments, format);
        
        while ((eachObject = va_arg(arguments, id))) {
            format = [format stringByAppendingString:[NSString stringWithFormat:@"\n%@",eachObject]];
        }
        va_end(arguments);
    }
    
    FYAlertMsg(format);
}

+ (void)addMonitor {
    FYAssertHandler* handler = [[FYAssertHandler alloc] init];
    
    [[[NSThread currentThread] threadDictionary] setValue:handler forKey:NSAssertionHandlerKey];
}

@end
