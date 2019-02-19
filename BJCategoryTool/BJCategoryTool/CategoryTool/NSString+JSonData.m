//
//  NSString+JSonData.m
//  RiverCaptain
//
//  Created by zbj on 2018/9/3.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import "NSString+JSonData.h"

@implementation NSString(JSonData)
// JSON字符串解析转换成字典
-(NSDictionary *)convertToJSONDictionary{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
