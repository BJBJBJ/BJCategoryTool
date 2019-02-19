//
//  NSDate+HSFormat.m
//  ZCInsurance
//
//  Created by wuhuisheng on 16/3/2.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import "NSDate+HSFormat.h"

@implementation NSDate (HSFormat)
-(NSString*)getStringWithformat:(NSString *)format{
    
    NSDateFormatter * dateformat =[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:format];
    return [dateformat stringFromDate:self];
 
}
/** 时间戳*/
-(NSString*)getTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timesTamp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timesTamp;
}
@end
