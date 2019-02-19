//
//  NSString+HSDate.m
//  ZCInsurance
//
//  Created by wuhuisheng on 16/3/2.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import "NSString+HSDate.h"

@implementation NSString (HSDate)

//减少内存消耗
static NSDateFormatter *_instance=nil;
+(NSDateFormatter *)shareDateFormatter{
    if (!_instance) {
        _instance=[[NSDateFormatter alloc]init];
    }
    return _instance;
}
- (NSDate *)getDateWithFormat:(NSString*)format{
   
   [[NSString shareDateFormatter] setDateFormat:format];
    return [[NSString shareDateFormatter] dateFromString:self];
}


+(NSString *)timestampConversionForsec:(NSString *)timeString
                            withFormat:(NSString *)formatter{
    if (timeString.length>=10) {
        //Objective-C的时间戳与java的时间戳相差1000倍，用java的时间戳除以1000即可
        NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:([timeString doubleValue]/1000)];
        [[NSString shareDateFormatter] setDateFormat:formatter];
        NSString *currentDateStr = [[NSString shareDateFormatter] stringFromDate:confromTimesp];
        return currentDateStr;
    }
    else
        return @"";
    
}
-(NSString *)conversionTimesTampWithFormatter:(NSString *)format{
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        
        [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        
        [formatter setTimeZone:timeZone];
        NSDate* date = [formatter dateFromString:self]; //------------将字符串按formatter转成nsdate
        //时间转时间戳的方法:
        NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    return [NSString stringWithFormat:@"%ld",(long)timeSp];
 
}
/** 计算两个时间戳的时差*/
+ (NSString*)compareTwoTimeTampWithTamp1:(NSInteger)Tamp1
                                   Tamp2:(NSInteger)Tamp2{
    
    NSTimeInterval balance = Tamp2 /1000-Tamp1 /1000;
    NSString*timeString = [[NSString alloc]init];
    timeString = [NSString stringWithFormat:@"%f",balance];
    NSInteger timeInt = [timeString intValue];
    NSInteger hour = timeInt/3600;
    NSInteger min = (timeInt%3600)/60;
    NSInteger second = timeInt%60;
    timeString =[NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hour,(long)min,(long)second];
    return timeString;
}

@end
