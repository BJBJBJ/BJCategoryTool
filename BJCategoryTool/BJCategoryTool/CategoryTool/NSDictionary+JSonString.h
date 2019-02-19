//
//  NSDictionary+JSonString.h
//  RiverCaptain
//
//  Created by zbj on 2018/9/3.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(JSonString) 
/**字典转换成json字符串*/
-(NSString*)convertToJSONString;
@end
