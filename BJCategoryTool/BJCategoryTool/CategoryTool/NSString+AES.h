//
//  NSString+AES.h
//  GYShareBook
//
//  Created by zbj on 2017/8/10.
//  Copyright © 2017年 JINan WIDE AREA SOFTWARE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(AES)

/**
 AES加密
 @param key 盐
 @return 加密后string
 */
-(NSString *)aes256_encrypt:(NSString *)key;

/**
 AES解密

 @param key 盐
 @return 解密后string
 */
-(NSString *)aes256_decrypt:(NSString *)key;
@end
