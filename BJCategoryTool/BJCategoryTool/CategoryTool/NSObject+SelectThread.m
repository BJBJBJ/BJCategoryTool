//
//  NSObject+SelectThread.m
//  HuoGuo
//
//  Created by zbj on 2017/1/3.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import "NSObject+SelectThread.h"


//// 全局并发队列的优先级
// DISPATCH_QUEUE_PRIORITY_HIGH 2               // 高
// DISPATCH_QUEUE_PRIORITY_DEFAULT 0            // 默认(中)
// DISPATCH_QUEUE_PRIORITY_LOW (-2)             // 低
// DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台



@implementation NSObject(SelectThread)

- (void)performBlockOnMainThreadSync:(NSObjectVoidBlock)block{
    if(block){
        if([NSThread isMainThread]){
            block();
        }
        else{
            dispatch_sync(dispatch_get_main_queue(), block);
        }
    }
}

- (void)performBlockOnMainThreadAsync:(NSObjectVoidBlock)block{
    if(block){
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

- (void)performBlockOnBackgroundThreadAsync:(NSObjectVoidBlock)block{
   
    if (block) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
    }
    
    
}

//dispatch_after只是延时提交block，并不是延时后立即执行。所以想用dispatch_after精确控制运行状态的朋友可要注意了~
-(void)performBlockOnMainThreadAfter:(CGFloat)duration Sync:(NSObjectVoidBlock)block{
    if (block) {
    
        [self performBlockOnMainThreadSync:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                block();
            });
 
        }];
 
    }
    
}

//正确创建dispatch_time_t
//
//用dispatch_after的时候就会用到dispatch_time_t变量，但是如何创建合适的时间呢？答案就是用dispatch_time函数，其原型如下：
//
//1
//dispatch_time_t dispatch_time ( dispatch_time_t when, int64_t delta );
//第一个参数一般是DISPATCH_TIME_NOW，表示从现在开始。
//
//那么第二个参数就是真正的延时的具体时间。
//
//这里要特别注意的是，delta参数是“纳秒！”，就是说，延时1秒的话，delta应该是“1000000000”=。=，太长了，所以理所当然系统提供了常量，如下：
//
//1
//2
//3
//#define NSEC_PER_SEC 1000000000ull
//#define USEC_PER_SEC 1000000ull
//#define NSEC_PER_USEC 1000ull
//关键词解释：
//
//NSEC：纳秒。
//USEC：微妙。
//SEC：秒
//PER：每
//所以：
//
//NSEC_PER_SEC，每秒有多少纳秒。
//USEC_PER_SEC，每秒有多少毫秒。（注意是指在纳秒的基础上）
//NSEC_PER_USEC，每毫秒有多少纳秒。
//所以，延时1秒可以写成如下几种：
//
//dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
//
//dispatch_time(DISPATCH_TIME_NOW, 1000 * USEC_PER_SEC);
//
//dispatch_time(DISPATCH_TIME_NOW, USEC_PER_SEC * NSEC_PER_USEC);
//
//最后一个“USEC_PER_SEC * NSEC_PER_USEC”，翻译过来就是“每秒的毫秒数乘以每毫秒的纳秒数”，也就是“每秒的纳秒数”，所以，延时500毫秒之类的，也就不难了吧~
@end
