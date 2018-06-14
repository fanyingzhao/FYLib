//
//  NSObject+FYAdd.h
//  FFKit
//
//  Created by fan on 16/7/6.
//  Copyright © 2016年 fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FYAdd)

/**
 *  交换实例方法
 *
 *  @param originSel 原始方法
 *  @param newSel    新的方法
 *
 *  @return 是否成功
 */
+ (BOOL)swizzleInstanceMethod:(SEL)originSel newSel:(SEL)newSel;

/**
 *  交换类方法
 *
 *  @param originSel 原始方法
 *  @param newSel    新的方法
 *
 *  @return 是否成功
 */
+ (BOOL)swizzleClassMethod:(SEL)originSel newSel:(SEL)newSel;

/**
 *  强引用关联一个变量到当前的对象
 *
 *  @param value 对象
 *  @param key   key
 */
- (void)setAssociateValue:(id)value key:(const void*)key;

/**
 *  弱引用关联一个变量到当前的对象
 *
 *  @param value 对象
 *  @param key   key
 */
- (void)setAssociateWeakValue:(id)value key:(const void*)key;

/**
 *  移除关联
 */
- (void)removeAssociatedValue;

/**
 *  得到某个关联的对象
 *
 *  @param key key
 *
 *  @return 返回关联的对象
 */
- (id)getAssociatedValueForKey:(const void*)key;


#pragma mark - sendMessage
///=============================================================================
/// 跨线程，延迟执行无法及时得到返回值，如果想要得到返回值，请在当前线程没有延迟的执行，如果不同线程，
/// 需要先阻塞住当前线程才能得到返回值
///=============================================================================

- (id)performSelectorWithArgs:(SEL)sel, ...;
- (id)performSelectorWithArgsOnMainThread:(SEL)sel waitUntiDone:(BOOL)wait, ...;
- (id)performSelectorWithArgs:(SEL)sel onThread:(NSThread*)thread waitUntiDone:(BOOL)wait, ...;

- (void)performSelectorWithArgsInBackground:(SEL)sel, ...;
- (void)performSelectorWithArgs:(SEL)sel afterDelay:(NSTimeInterval)delay, ...;
- (void)performSelectorWithArgs:(SEL)sel onThread:(NSThread*)thread afterDelay:(NSTimeInterval)delay waitUntiDone:(BOOL)wait modes:(NSArray<NSString *> *)array, ...;

@end
