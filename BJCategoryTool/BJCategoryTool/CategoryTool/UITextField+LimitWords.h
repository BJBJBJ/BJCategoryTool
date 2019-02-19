//
//  BJTextField+LimitWords.h
//  ZCInsurance
//
//  Created by zbj-mac on 16/4/11.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark----限制长度-----
@interface UITextField(LimitWords)
/**
 *  UITextField限制输入字数
 *
 *  @param textFieldLength 限制长度
 */
-(void)limitWords:(int)textFieldLength;

@end


@interface UITextView(LimitWords)
/**
 *  UITextView限制输入字数
 *
 *  @param textViewLength 限制长度
 */
-(void)limitWords:(int)textViewLength;

@end



#pragma mark----UITextField输入手机格式-----

@interface UITextField (PhoneFormatted)
-(BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end


