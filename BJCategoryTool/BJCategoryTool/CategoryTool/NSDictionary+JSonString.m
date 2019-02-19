//
//  NSDictionary+JSonString.m
//  RiverCaptain
//
//  Created by zbj on 2018/9/3.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import "NSDictionary+JSonString.h"

@implementation NSDictionary(JSonString)
// 字典转换成json字符串
-(NSString*)convertToJSONString{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self  options:NSJSONWritingPrettyPrinted  error:&error];
    NSString *jsonString = @"";
    if (! jsonData){
        NSLog(@"Got an error: %@", error);
    }else{
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    //中文、空格字符解码 iOS9新方法 支持iOS7.0以上
    jsonString =[jsonString stringByRemovingPercentEncoding];
   
    //ios9以前
//    jsonString= [jsonString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" "withString:@""options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去除掉首尾的空白字符和换行字符
    [mutStr replaceOccurrencesOfString:@"\n"withString:@""options:NSLiteralSearch range:range2];
    return mutStr;
}
@end
