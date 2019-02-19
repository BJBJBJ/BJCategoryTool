//
//  UITextField+BJPlaceholder.m
//  LoginTest
//
//  Created by zbj on 2017/2/9.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import "UITextField+BJPlaceholder.h"

@implementation UITextField(BJPlaceholder)
-(void)bj_setPlaceholderWith:(NSString*)placeholder color:(UIColor*)color{
    
    self.placeholder=placeholder;
    [self bj_setPlaceholderColorWith:color];
}
-(void)bj_setPlaceholderColorWith:(UIColor*)color{
    
    if (!color) return;
    
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
