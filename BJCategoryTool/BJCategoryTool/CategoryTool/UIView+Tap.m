//
//  UIView+Tap.m
//  Estuarine_inspection
//
//  Created by zbj on 2019/1/16.
//  Copyright © 2019年 广域软件. All rights reserved.
//

#import "UIView+Tap.h"

@implementation UIView(Tap)

-(OnClick)onClick{
    return objc_getAssociatedObject(self, @selector(onClick));
}
-(void)setOnClick:(OnClick)onClick{
    objc_setAssociatedObject(self, @selector(onClick), onClick,  OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UITapGestureRecognizer *)tapGestureRecognizer{
    
    return objc_getAssociatedObject(self, @selector(tapGestureRecognizer));
}
-(void)setTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    objc_setAssociatedObject(self, @selector(tapGestureRecognizer), tapGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)addTapGestureRecognizer:(OnClick)onClick{
    self.onClick=onClick;
    self.userInteractionEnabled=YES;
    self.tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnClick:)];
    [self.tapGestureRecognizer setNumberOfTapsRequired:1];
    [self addGestureRecognizer:self.tapGestureRecognizer];
}
-(void)OnClick:(UITapGestureRecognizer *)gesture{
    !self.onClick?:self.onClick(gesture);
}

-(void)removeTapGestureRecognizer{
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    self.tapGestureRecognizer=nil;
}

@end
