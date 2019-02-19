//
//  UITextField+BJPlaceholder.h
//  LoginTest
//
//  Created by zbj on 2017/2/9.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField(BJPlaceholder)

/**
 设置UITextField的占位文字及占位颜色
 @param placeholder  占位文字
 @param color        占位文字颜色
 */
-(void)bj_setPlaceholderWith:(NSString*)placeholder color:(UIColor*)color;


/**
 设置UITextField的占位文字颜色
 @param color 占位文字颜色
 */
-(void)bj_setPlaceholderColorWith:(UIColor*)color;
@end
