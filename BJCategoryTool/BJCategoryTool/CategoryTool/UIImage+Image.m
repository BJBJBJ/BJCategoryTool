//
//  UIImage+Image.m
//  
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)bj_getImageWithColor:(UIColor *)color{
    
    return [UIImage bj_getImageWithColor:color andHeight:1.0f];
}
/** 根据颜色生成图片*/
+(UIImage*)bj_getImageWithColor:(UIColor*)color andHeight:(CGFloat)height{
    // 描述矩形
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, height);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();

    return  theImage;
}

@end
