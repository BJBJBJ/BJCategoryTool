//
//  UIView+BorderLine.h
//  popViewTest
//
//  Created by zbj on 2018/4/24.
//  Copyright © 2018年 zbj. All rights reserved.
//


//箭头的x默认值 UIView的width*0.5
//箭头的y
#define bj_arrY  7.0

//箭头的宽
#define bj_arrW 10.0

//边框的圆角
#define bj_corRadius 10.0

#import <UIKit/UIKit.h>

@interface UIView (BorderLine)

#pragma mark -----setter

/**
 箭头的X值
 
 @param bj_arrowX 箭头的X值
 */
- (void)setBj_arrowX:(CGFloat)bj_arrowX;

/**
 箭头的Y值
 
 @param bj_arrowY  箭头的Y值
 */
- (void)setBj_arrowY:(CGFloat)bj_arrowY;

/**
 箭头的Width值

 @param bj_arrowW  箭头的Width值
 */
- (void)setBj_arrowW:(CGFloat)bj_arrowW;

/**
 边框的圆角半径

 @param bj_cornerRadius 边框的圆角半径
 */
- (void)setBj_cornerRadius:(CGFloat)bj_cornerRadius;


#pragma mark -----Public

/**
 绘制上凸三角边框
 */
-(void)bj_drawingUpJogBorderLine;


/**
 绘制下凸三角边框
 */
-(void)bj_drawingDownJogBorderLine;






@end










