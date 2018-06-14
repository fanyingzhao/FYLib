//
//  NSMutableArray+FYAdd.h
//  FFKit
//
//  Created by fan on 16/7/14.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (FYAdd)

/**
 *  在数组中添加一个弱引用的对象
 *
 *  @param anObject 要添加的对象
 */
- (void)addWeakObject:(id)anObject;

/**
 *  得到下标的对象，如果是强引用则返回强引用对象，如果是弱引用则返回弱引用的对象
 *
 *  @param index 引用对象的下标
 *
 *  @return 引用的对象
 */
- (id)weakObjectAtIndex:(NSInteger)index;

/**
 *  清理数组，将已经变空的对象从数组中删除
 */
- (void)clean;

/**
 添加一个项，如果已经存在，则不再添加

 @param object 要添加的项
 */
- (void)addObjectNoRepeat:(NSObject*)object;

@end
