//
//  UIView+BorderLine.m
//  popViewTest
//
//  Created by zbj on 2018/4/24.
//  Copyright © 2018年 zbj. All rights reserved.
//

#import "UIView+BorderLine.h"

#import <objc/runtime.h>

static char * const bj_arrowXKey="bj_arrowXKey";

static char * const bj_arrowYKey="bj_arrowYKey";

static char * const bj_arrowWKey="bj_arrowWKey";

static char * const bj_cornerRadiusKey="bj_cornerRadiusKey";

@implementation UIView (BorderLine)

#pragma mark -----getter

-(CGFloat)bj_arrowX{
        CGFloat _arrowX = [objc_getAssociatedObject(self, bj_arrowXKey) floatValue];
    return _arrowX;
}

-(CGFloat)bj_arrowY{
    CGFloat _arrowY = [objc_getAssociatedObject(self, bj_arrowYKey) floatValue];
     return _arrowY;
}
-(CGFloat)bj_arrowW{
     CGFloat _arrowW = [objc_getAssociatedObject(self, bj_arrowWKey) floatValue];
    return _arrowW;
}
-(CGFloat)bj_cornerRadius{
     CGFloat _cornerRadius = [objc_getAssociatedObject(self, bj_cornerRadiusKey) floatValue];
    return _cornerRadius;
}

#pragma mark -----setter

- (void)setBj_arrowX:(CGFloat)bj_arrowX{
    objc_setAssociatedObject(self, bj_arrowXKey, @(bj_arrowX), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)setBj_arrowY:(CGFloat)bj_arrowY{
    objc_setAssociatedObject(self, bj_arrowYKey, @(bj_arrowY), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)setBj_arrowW:(CGFloat)bj_arrowW{
    objc_setAssociatedObject(self, bj_arrowWKey, @(bj_arrowW), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)setBj_cornerRadius:(CGFloat)bj_cornerRadius{
    objc_setAssociatedObject(self, bj_cornerRadiusKey, @(bj_cornerRadius), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark -----Public
/** 绘制上凸三角边框*/
-(void)bj_drawingUpJogBorderLine{
    
    //上凸三角
    //确定好7个点就OK
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    if (self.bj_cornerRadius<=1) {
        self.bj_cornerRadius=bj_corRadius;
    }
    
    if (self.bj_arrowX<=1.0) {
        self.bj_arrowX=viewWidth*0.5;
    }
    
    if (self.bj_arrowW<=1.0) {
        self.bj_arrowW=bj_arrW;
    }
    if (self.bj_arrowY<=1.0) {
        self.bj_arrowY=bj_arrY;
    }
    
    
    CGFloat cornerRadius = self.bj_cornerRadius;
    CGFloat arrowX = self.bj_arrowX;
    CGFloat arrowWidth = self.bj_arrowW;
    CGFloat arrowY = self.bj_arrowY;
    
    CGPoint point1 = CGPointMake(0, arrowY);
    //key point 2,3,4
    CGPoint point2 = CGPointMake(arrowX - arrowWidth*0.5, arrowY);
    CGPoint point3 = CGPointMake(arrowX, 0);
    CGPoint point4 = CGPointMake(arrowX+arrowWidth*0.5, arrowY);
    CGPoint point5 = CGPointMake(viewWidth, arrowY);
    CGPoint point6 = CGPointMake(viewWidth, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (cornerRadius == 0) {
        [path moveToPoint:point1];
        [path addLineToPoint:point2];
        [path addLineToPoint:point3];
        [path addLineToPoint:point4];
        [path addLineToPoint:point5];
        [path addLineToPoint:point6];
        [path addLineToPoint:point7];
    }else{
        //顺序有影响
        
        /**
         *  以某个中心点画弧线
         *  @param center     指定了圆弧所在正圆的圆心点坐标
         *  @param radius     指定了圆弧所在正圆的半径
         *  @param startAngle 指定了起始弧度位置  注意: 起始与结束这里是弧度
         *  @param endAngle   指定了结束弧度位置
         *  @param clockwise  指定了绘制方向，以时钟方向为判断基准   看下图
         */
        [path addArcWithCenter:CGPointMake(cornerRadius, arrowY+cornerRadius) radius:cornerRadius startAngle:2*M_PI_2 endAngle:3*M_PI_2 clockwise:YES];
        
        [path addLineToPoint:point2];
        [path addLineToPoint:point3];
        [path addLineToPoint:point4];
        [path addArcWithCenter:CGPointMake(viewWidth-cornerRadius, cornerRadius+arrowY) radius:cornerRadius startAngle:3*M_PI_2 endAngle:0 clockwise:YES];
        [path addArcWithCenter:CGPointMake(viewWidth-cornerRadius, viewHeight-cornerRadius) radius:cornerRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [path addArcWithCenter:CGPointMake(cornerRadius, viewHeight-cornerRadius) radius:cornerRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    }
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}


/** 绘制下凸三角边框*/
-(void)bj_drawingDownJogBorderLine{
    //下凸三角
    //确定好7个点就OK
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    if (self.bj_cornerRadius<=1) {
        self.bj_cornerRadius=bj_corRadius;
    }
    
    if (self.bj_arrowX<=1.0) {
        self.bj_arrowX=viewWidth*0.5;
    }
    
    if (self.bj_arrowW<=1.0) {
        self.bj_arrowW=bj_arrW;
    }
    if (self.bj_arrowY<=1.0) {
        self.bj_arrowY=bj_arrY;
    }
    
    CGFloat cornerRadius = self.bj_cornerRadius;
    CGFloat arrowX = self.bj_arrowX;
    CGFloat arrowWidth = self.bj_arrowW;
    CGFloat arrowY = self.bj_arrowY;
    
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWidth, 0);
    CGPoint point3 = CGPointMake(viewWidth, viewHeight-arrowY);
     //key point 4,5,6
    CGPoint point4 = CGPointMake(arrowX+arrowWidth*0.5, viewHeight-arrowY);
    CGPoint point5 = CGPointMake(arrowX, viewHeight);
    CGPoint point6 = CGPointMake(arrowX-arrowWidth*0.5, viewHeight-arrowY);
    CGPoint point7 = CGPointMake(0, viewHeight-arrowY);
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (cornerRadius == 0) {
        [path moveToPoint:point1];
        [path addLineToPoint:point2];
        [path addLineToPoint:point3];
        [path addLineToPoint:point4];
        [path addLineToPoint:point5];
        [path addLineToPoint:point6];
        [path addLineToPoint:point7];
    }else{
        //顺序有影响
     
        [path addArcWithCenter:CGPointMake(cornerRadius, cornerRadius) radius:cornerRadius startAngle:2*M_PI_2 endAngle:3*M_PI_2 clockwise:YES];
        [path addArcWithCenter:CGPointMake(viewWidth-cornerRadius, cornerRadius) radius:cornerRadius startAngle:3*M_PI_2 endAngle:0 clockwise:YES];
        [path addArcWithCenter:CGPointMake(viewWidth-cornerRadius, viewHeight-cornerRadius-arrowY) radius:cornerRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [path addLineToPoint:point4];
        [path addLineToPoint:point5];
        [path addLineToPoint:point6];
        [path addArcWithCenter:CGPointMake(cornerRadius, viewHeight-cornerRadius-arrowY) radius:cornerRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    }
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

@end
