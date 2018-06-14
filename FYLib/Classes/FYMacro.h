//
//  FYKitMacro.h
//  FFKit
//
//  Created by fan on 16/6/28.
//  Copyright © 2016年 fan. All rights reserved.
//

#ifndef FYKitMacro_h
#define FYKitMacro_h

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

/*---------字符串-----------------------*/
#define FYString(format, ...)   [NSString stringWithFormat:format, ##__VA_ARGS__]

/*---------输出-----------------------*/
#ifdef DEBUG
#define FYLog(format, ...) NSLog((@"<%@ %@ %d>  " format), [[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent], [[[NSString stringWithFormat:@"%s",__FUNCTION__] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" ]"]] objectAtIndex:1], __LINE__,##__VA_ARGS__)
#else
#define FYLog(format, ...)
#endif

/*---------断言-----------------------*/
#define FYAssertNil(condition, description, ...) NSAssert(!(condition), (description), ##__VA_AGRS__)
#define FYCAssertNil(condition, description, ...) NSCAssert(!(condition), (description), ##__VA_ARGS__)

#define FYAssertNotNil(condition, description, ...) NSAssert((condition), (description), ##__VA_ARGS__)
#define FYCAssertNotNil(condition, description, ...) NSCAssert((condition), (description), ##__VA_ARGS__)

#define FYAssertMainThread NSAssert([NSThread isMainThread],@"必须在主线程上调用")
#define FYCAssertMainThread NSCAssert([NSThread isMainThread],@"必须在主线程上调用")

/*---------提示信息-----------------------*/
#ifdef DEBUG
#define FYAlertMsg(msg) \
UIView* view = [[UIView alloc] init];\
if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait || [UIDevice currentDevice].orientation == UIDeviceOrientationPortraitUpsideDown){\
    view.frame = [UIScreen mainScreen].bounds;\
}else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {\
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);\
}\
view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];\
UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(view.bounds) - 20 * 2, CGRectGetHeight(view.bounds) - 100 * 2)];\
textView.text = msg;\
textView.editable = NO;\
textView.font = [UIFont systemFontOfSize:15];\
textView.textColor = [UIColor whiteColor];\
textView.backgroundColor = [UIColor clearColor];\
[view addSubview:textView];\
[[UIApplication sharedApplication].windows.lastObject addSubview:view];
#else
#define FYAlertMsg(msg)
#endif


/*---------指针-----------------------*/
#ifdef DEBUG
#define ext_keywordify autoreleasepool {}
#else
#define ext_keywordify try {} @catch (...) {}
#endif

#define weakify(self) \
ext_keywordify \
__attribute__((objc_ownership(weak))) __typeof__(self) self_weak_ = (self)

#define strongify(self) \
ext_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wunused-variable\"") \
__attribute__((objc_ownership(strong))) __typeof__(self) self = (self_weak_)\
_Pragma("clang diagnostic pop")


/*---------编译-----------------------*/
#ifdef __culpsplus
#define FY_EXTERN_C_BEGIN   extern "C" {
#define FY_EXTERN_C_END     }
#else
#define FY_EXTERN_C_BEGIN
#define FY_EXTERN_C_END
#endif

/*---------简化方法-----------------------*/
#define executeOnMain(block)    if ([NSThread isMainThread]) {\
    block\
}else {\
    dispatch_async(dispatch_get_main_queue(), ^{\
        block;\
    });\
}

#define UIAppdelegate         [UIApplication sharedApplication].delegate
#define NibRegister(NibClass)       [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(NibClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(NibClass)]
#define CellRegister(CellClass)   [self.tableView registerClass:[CellClass class] forCellReuseIdentifier:NSStringFromClass([CellClass class])]
#define CellRegister1(tableView,CellClass)   [tableView registerClass:[CellClass class] forCellReuseIdentifier:NSStringFromClass([CellClass class])]

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

#define TICK   NSDate *startTime = [NSDate date];
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);

#ifdef DEBUG
#define FPS     static int frames = 0;\
static CFTimeInterval CurrentTime;\
static CFTimeInterval LastFPSUpdate;\
++frames;\
CurrentTime = CACurrentMediaTime();\
if ((CurrentTime - LastFPSUpdate) > 1.0f) {\
if (frames != 1) {\
printf("fps: %d\n", frames);\
frames = 0;\
}\
LastFPSUpdate = CurrentTime;\
}
#else 
#define FPS
#endif

#define FYDownloadLength(url) [[[NSFileManager defaultManager] attributesOfItemAtPath:url error:nil][NSFileSize] integerValue]

static const float EPSINON = 1E-5;


/*---------设备信息-----------------------s*/
#define UIDEVICE_SCREEN_WIDTH          [UIScreen mainScreen].bounds.size.width                         // 屏幕宽度
#define UIDEVICE_SCREEN_HEIGHT         [UIScreen mainScreen].bounds.size.height                        // 屏幕高度
#define UIDEVICE_LANDSPACE_WIDTH       MAX(UIDEVICE_SCREEN_WIDTH, UIDEVICE_SCREEN_HEIGHT)                    // 横屏宽度
#define UIDEVICE_LANDSPACE_HEIGHT      MIN(UIDEVICE_SCREEN_WIDTH, UIDEVICE_SCREEN_HEIGHT)                    // 横屏高度
#define UIDEVICE_NAV_HEIGHT                         64
#define UIDEVICE_STATUS_HEIGHT         CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])

// 默认目录
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define PATH_OF_CACHE       [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/*---------颜色-----------------------*/
#define UICOLOR_RGB(r, g, b)               [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.0]
#define UICOLOR_RGB_ALPHA(r, g, b, a)      [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define UICOLOR_HEX(hex)                   [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 \
                                                          blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
#define UICOLOR_HEX_ALPHA(hex, a)             [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 \
                                                          blue:((float)(hex & 0xFF))/255.0 alpha:a]




#endif /* FYKitMacro_h */
