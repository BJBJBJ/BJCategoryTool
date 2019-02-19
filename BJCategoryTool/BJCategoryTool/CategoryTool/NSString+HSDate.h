//
//  NSString+HSDate.h
//  ZCInsurance
//
//  Created by wuhuisheng on 16/3/2.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HSDate)
/**
 *  根据格式返回时间(使用时注意格式，按正常操作否则肯能出现未知错误)
 *
 *  @param format yyyy-MM-dd HH:mm:ss
 *
 *  @return 对应时间
 */
- (NSDate *)getDateWithFormat:(NSString*)format;

/** 时间戳转时间串*/
+(NSString *)timestampConversionForsec:(NSString *)timeString
                            withFormat:(NSString *)formatter;
/** 计算两个时间戳的时差*/
+ (NSString*)compareTwoTimeTampWithTamp1:(NSInteger)Tamp1
                                   Tamp2:(NSInteger)Tamp2;
/** 时间串转时间戳*/
-(NSString *)conversionTimesTampWithFormatter:(NSString *)format;
@end
