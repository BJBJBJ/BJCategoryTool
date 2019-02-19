//
//  NSObject+MethodSwizzling.h
//  HuoGuo
//
//  Created by zbj on 2017/1/9.
//  Copyright © 2017年 zbj. All rights reserved.
//

//runtime 黑魔法方法交换
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject(MethodSwizzling)
/**
 *  交换对象方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)bj_swizzleInstanceSelector:(SEL)origSelector
                   swizzleSelector:(SEL)swizzleSelector;

/**
 *  交换类方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)bj_swizzleClassSelector:(SEL)origSelector
                swizzleSelector:(SEL)swizzleSelector;
@end
