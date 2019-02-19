//
//  NSObject+Timer.m
//  HtmlDemo
//
//  Created by zbj on 2018/9/5.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import "NSObject+Timer.h"
#import <objc/runtime.h>
///** GCD计时器一定要设置为成员变量， 否则会立即释放*/
//@property (nonatomic, strong)   dispatch_source_t tTimer;  

static char * const timerKey="bj_timerKey";
static char * const suspendKey="bj_isSuspendKey";
@implementation NSObject(Timer)

-(dispatch_source_t)bj_tTimer{
    return objc_getAssociatedObject(self, timerKey);
}
-(void)setBj_tTimer:(dispatch_source_t)tTimer{
    objc_setAssociatedObject(self, timerKey, tTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString*)bj_isSuspend{
    return objc_getAssociatedObject(self, suspendKey);
}
-(void)setBj_isSuspend:(NSString*)isSuspend{
    objc_setAssociatedObject(self, suspendKey, isSuspend, OBJC_ASSOCIATION_ASSIGN);
}
/** 开启计时*/
-(void)bj_startTimerInterval:(CGFloat)interval
                eventHandler:(void(^)(void))eventHandler{
    if (self.bj_tTimer) {[self bj_removeTimer];}
    //创建GCD timer资源， 第一个参数为源类型， 第二个参数是资源要加入的队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.bj_tTimer =
    dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //设置timer信息， 第一个参数是我们的timer对象， 第二个是timer首次触发延迟时间， 第三个参数是触发时间间隔， 最后一个是是timer触发允许的延迟值， 建议值是十分之一
    dispatch_source_set_timer(self.bj_tTimer,
                              dispatch_walltime(NULL, 0),
                              interval * NSEC_PER_SEC,
                              0.1*NSEC_PER_SEC);
    
    //设置timer的触发事件
    dispatch_source_set_event_handler(self.bj_tTimer, ^{
        
        !eventHandler?:eventHandler();
    });
    
    //激活timer对象
    dispatch_resume(self.bj_tTimer);
    self.bj_isSuspend=@"NO";
}
/** 暂停计时*/
-(void)bj_suspendTimer{
    if (!self.bj_tTimer)  return;
    self.bj_isSuspend=@"YES";
    dispatch_suspend(self.bj_tTimer);
}
/** 恢复计时*/
-(void)bj_resumeTimer{
    if (!self.bj_tTimer) return;
    self.bj_isSuspend=@"NO";
    dispatch_resume(self.bj_tTimer);
}
/** 移除计时*/
-(void)bj_removeTimer{
    if (!self.bj_tTimer) return;
    //销毁timer, 注意暂停的timer资源不能直接销毁， 需要先resume再cancel， 否则会造成内存泄漏
    if ([self.bj_isSuspend isEqualToString:@"YES"]) {
        dispatch_resume(self.bj_tTimer);
    }
    dispatch_source_cancel(self.bj_tTimer);
    self.bj_tTimer=nil;
}

@end
