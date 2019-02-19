//
//  UIView+Tap.h
//  Estuarine_inspection
//
//  Created by zbj on 2019/1/16.
//  Copyright © 2019年 广域软件. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
//view 添加单击手势
typedef void (^OnClick)(UITapGestureRecognizer *tapGestureRecognizer);
@interface UIView(Tap)


@property(nonatomic,copy,readonly)OnClick onClick;
@property(nonatomic,strong,readonly)UITapGestureRecognizer *tapGestureRecognizer;


/**
 *  view 添加单击手势
 *  @param onClick 手势回调
 */
-(void)addTapGestureRecognizer:(OnClick)onClick;
/**
 *  view 清除单击手势
 */
-(void)removeTapGestureRecognizer;
@end
