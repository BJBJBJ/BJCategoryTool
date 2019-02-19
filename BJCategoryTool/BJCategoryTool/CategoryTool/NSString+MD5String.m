//
//  NSString+MD5String.m
//  ZCInsurance
//
//  Created by wuhuisheng on 16/3/9.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import "NSString+MD5String.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (MD5String)
- (NSString *)getMd5_32BitString {
    const char* cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    
    return ret;
}



@end
