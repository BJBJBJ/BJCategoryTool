//
//  NSObject+Timer.h
//  HtmlDemo
//
//  Created by zbj on 2018/9/5.
//  Copyright © 2018年 zbj. All rights reserved.
//

//一个对象只能开启一个计时器
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject(Timer)
/**开启计时
 @param interval     时间间隔
 @param eventHandler 执行block
 */
-(void)bj_startTimerInterval:(CGFloat)interval
                eventHandler:(void(^)(void))eventHandler;
/** 暂停计时*/
-(void)bj_suspendTimer;
/** 恢复计时*/
-(void)bj_resumeTimer;
/** 移除计时*/
-(void)bj_removeTimer;
@end
