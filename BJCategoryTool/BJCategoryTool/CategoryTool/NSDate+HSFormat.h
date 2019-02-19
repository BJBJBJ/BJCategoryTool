//
//  NSDate+HSFormat.h
//  ZCInsurance
//
//  Created by wuhuisheng on 16/3/2.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HSFormat)
/**
 *  获取对应format的时间字符串 系统当前时间
 *
 *  @param format yyyy-MM-dd HH:mm:ss
 *
 *  @return 时间的字符串
 */
-(NSString*)getStringWithformat:(NSString *)format;

/** 时间戳*/
-(NSString*)getTimestamp;
@end
