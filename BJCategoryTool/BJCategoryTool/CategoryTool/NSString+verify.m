//
//  NSString+verify.m
//  BJTextField
//
//  Created by zbj-mac on 16/4/8.
//  Copyright © 2016年 zbj. All rights reserved.
//

#import "NSString+verify.h"

@implementation NSString(verify)
#pragma mark----判断字符串是否为空----
/**
 *  验证字符串是否为nill,NULL NSNull, @""
 *  @return  空YES 否则NO
 */
-(BOOL)isEmptyString{

    if (self == nil) {
        return YES;
    }
    if (self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([self length]==0) {
        
        return YES;
    }
    if ([self isEqualToString:@""]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([self isEqualToString:@"(null)"]) {
        return YES;
    }
    return NO;
}
-(BOOL)isValueString{
    
    if ((self!=nil)&&(self!=NULL)&&!([self isKindOfClass:[NSNull class]])&&!([self isEqualToString:@"(null)"])){
        
        return YES;
    }
    
    return NO;
}
#pragma mark-----判断是否电话-----
/**
 *  验证是否电话
 *
 *  @return  是电话YES   否则 NO
 */
-(BOOL)isMobile{
//    手机号以13，14, 15，17,18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";

    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}
#pragma mark-----判断是否邮件----
/**
 *  验证是否邮件
 *  @return  是邮件YES   否则 NO
 */
-(BOOL)isEmail{
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:self];
}
#pragma mark----是否是姓名(中英文)----
/**
 *  验证姓名
 *  @return  是姓名YES   否则 NO
 */
-(BOOL)isRealName{
    NSString *nameRegex = @"^[\u4E00-\u9FA5A-Za-z]{1,10}";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    return [nameTest evaluateWithObject:self];
}

#pragma mark-----判断是否纯数字----
/**
 *  验证是否纯数字
 *  @return  是纯数字YES   否则 NO
 */
-(BOOL)isAllNum{
    if (self.length==0) {
        return NO;
    }
    unichar c;
    for (int i=0; i<self.length; i++) {
        c=[self characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}
#pragma mark----身份证号----
/**
 *  验证身份证号
 *  @return  是身份证号Yes 否则No
 */
-(BOOL)isIDCard{
    //@"\\d{14}[[0-9],0-9xX]"
    NSString *IDCardRegex = @"\\d{14}[[0-9],0-9xX]";
    NSPredicate *IDCardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IDCardRegex];
    return [IDCardTest evaluateWithObject:self];
  
}
#pragma mark----QQ----
/**
 *  验证QQ
 *  @return  是QQ Yes 否则NO
 */
-(BOOL)isQQ{
    //[1-9][0-9]\{4,\}
    NSString *QQRegex = @"[1-9][0-9]{4,}";
    NSPredicate *QQTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",QQRegex];
    return [QQTest evaluateWithObject:self];
}


@end
