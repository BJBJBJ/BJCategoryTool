//
//  UIView+CurrentController.m
//  Estuarine_inspection
//
//  Created by caoss on 2019/1/11.
//  Copyright © 2019年 广域软件. All rights reserved.
//

#import "UIView+CurrentController.h"

@implementation UIView (CurrentController)
/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
@end
