//
//  UIButton+countDown.h
//  ZCInsurance
//
//  Created by zbj-mac on 16/3/1.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (countDown)


/**
*  倒计时按钮
*
*  @param timeLine 倒计时总时间
*  @param ntitle   恢复正常时的title
*  @param unit     倒计时的单位（s）
*  @param nColor   恢复正常时的背景颜色
*  @param color    倒计时时的背景颜色
*/
- (void)startWithTime:(NSInteger)timeLine normaltitle:(NSString *)ntitle timeUnit:(NSString *)unit normalColor:(UIColor *)nColor countColor:(UIColor *)color;
@end
