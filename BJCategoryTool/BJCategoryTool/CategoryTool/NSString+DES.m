//
//  NSString+DES.m
//  GYShareBook
//
//  Created by zbj on 2017/8/10.
//  Copyright © 2017年 JINan WIDE AREA SOFTWARE. All rights reserved.
//

#import "NSString+DES.h"
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"

@implementation NSString(DES)



//DES加密
+(NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key{
    
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
    NSUInteger dataLength = [plainText length];
    unsigned char buffer[1024];
    memset(buffer, 0,sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus =CCCrypt(kCCEncrypt,kCCAlgorithmDES,
                                         kCCOptionPKCS7Padding,
                                         [key UTF8String], kCCKeySizeDES,
                                         iv,
                                         textBytes, dataLength,
                                         buffer,1024,
                                         &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        ciphertext = [[NSString alloc] initWithData:[data base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength]encoding:NSUTF8StringEncoding];
    }
    return ciphertext;

}


@end
