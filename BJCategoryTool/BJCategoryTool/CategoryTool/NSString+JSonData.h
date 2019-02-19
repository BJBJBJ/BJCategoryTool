//
//  NSString+JSonData.h
//  RiverCaptain
//
//  Created by zbj on 2018/9/3.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(JSonData)
/** JSON字符串解析转换成字典*/
-(NSDictionary *)convertToJSONDictionary;
@end
