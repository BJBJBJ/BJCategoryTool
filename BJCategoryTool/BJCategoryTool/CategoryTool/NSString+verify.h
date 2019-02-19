//
//  NSString+verify.h
//  BJTextField
//
//  Created by zbj-mac on 16/4/8.
//  Copyright © 2016年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(verify)
#pragma mark----判断字符串是否为空----
///**
// *  验证字符串是否为nill,NULL NSNull, @""
// *  (输入文本推荐使用该方法)
// *  @return  空YES 否则NO
// */
//-(BOOL)isEmptyString;

/**
 验证字符串是否为有效字符串
 @return  是YES 不是NO
 */
-(BOOL)isValueString;
#pragma mark-----判断是否电话-----
/**
 *  验证是否电话
 *
 *  @return  是电话YES   否则 NO
 */
-(BOOL)isMobile;
#pragma mark-----判断是否邮件----
/**
 *  验证是否邮件
 *  @return  是邮件YES   否则 NO
 */
-(BOOL)isEmail;
#pragma mark----是否是姓名(中英文)----
/**
 *  验证姓名
 *  @return  是姓名YES   否则 NO
 */
-(BOOL)isRealName;

#pragma mark-----判断是否纯数字----
/**
 *  验证是否纯数字
 *  @return  是纯数字YES   否则 NO
 */
-(BOOL)isAllNum;
#pragma mark----身份证号----
/**
 *  验证身份证号
 *  @return  是身份证号Yes 否则No
 */
-(BOOL)isIDCard;
#pragma mark----QQ----
/**
 *  验证QQ
 *  @return  是QQ Yes 否则NO
 */
-(BOOL)isQQ;
@end
