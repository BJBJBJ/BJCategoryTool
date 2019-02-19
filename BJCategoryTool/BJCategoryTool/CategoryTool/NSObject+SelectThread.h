//
//  NSObject+SelectThread.h
//  HuoGuo
//
//  Created by zbj on 2017/1/3.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^NSObjectVoidBlock)(void);

@interface NSObject(SelectThread)
/** 主线程同步执行(当前线程是主线程则同步执行，不是主线程则获取主线程异步执行)*/
- (void)performBlockOnMainThreadSync:(NSObjectVoidBlock)block;
/** 主线程异步执行*/
- (void)performBlockOnMainThreadAsync:(NSObjectVoidBlock)block;
/** 后台线程异步执行*/
- (void)performBlockOnBackgroundThreadAsync:(NSObjectVoidBlock)block;
/** 主线程延迟执行*/
-(void)performBlockOnMainThreadAfter:(CGFloat)dration Sync:(NSObjectVoidBlock)block;
@end
