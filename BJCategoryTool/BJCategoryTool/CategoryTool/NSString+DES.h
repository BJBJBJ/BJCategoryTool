//
//  NSString+DES.h
//  GYShareBook
//
//  Created by zbj on 2017/8/10.
//  Copyright © 2017年 JINan WIDE AREA SOFTWARE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(DES)

/** DES加密*/
+(NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;
@end
