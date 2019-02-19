//
//  BJTextField+LimitWords.m
//  ZCInsurance
//
//  Created by zbj-mac on 16/4/11.
//  Copyright © 2016年 SaiDong. All rights reserved.
//

#import "UITextField+LimitWords.h"

@implementation UITextField(LimitWords)
-(void)limitWords:(int)textFieldLength{
    NSString *lang = [[[UIApplication sharedApplication] textInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) {//简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (self.text.length >textFieldLength &&self.markedTextRange == nil) {
                self.text = [self.text substringToIndex:textFieldLength];
                return;
            }
        }
    }else{
        if (self.text.length  >textFieldLength&&self.markedTextRange == nil) {
            self.text = [self.text substringToIndex:textFieldLength];
            return;
        }
    }
  
}
@end




@implementation UITextView(LimitWords)
-(void)limitWords:(int)textViewLength{
    NSString *lang = [[[UIApplication sharedApplication] textInputMode] primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (self.text.length >textViewLength &&self.markedTextRange == nil) {
                self.text = [self.text substringToIndex:textViewLength];
                return;
            }
        }
    }else{
        if (self.text.length  >textViewLength&&self.markedTextRange == nil) {
            self.text = [self.text substringToIndex:textViewLength];
            return;
        }
    }
    
}
@end



@implementation UITextField (PhoneFormatted)


    
    
-(BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
//    NSLog(@"%@",NSStringFromRange(range));
    if (self) {
        NSString* text = self.text;
        //删除
        if([string isEqualToString:@""]){
            //删除一位
            if(range.length == 1){
                //最后一位,遇到空格则多删除一次
                if (range.location == text.length-1 ) {
                    if ([text characterAtIndex:text.length-1] == ' ') {
                        [self deleteBackward];
                    }
                    return YES;
                }
                //从中间删除
                else{
                    NSInteger offset = range.location;
                    
                    if (range.location < text.length && [text characterAtIndex:range.location] == ' ' && [self.selectedTextRange isEmpty]) {
                        [self deleteBackward];
                        offset --;
                    }
                    [self deleteBackward];
                    self.text = [self parseString:self.text];
                    UITextPosition *newPos = [self positionFromPosition:self.beginningOfDocument offset:offset];
                    self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
                    return NO;
                }
            }
            else if (range.length > 1) {
                BOOL isLast = NO;
                //如果是从最后一位开始
                if(range.location + range.length == self.text.length ){
                    isLast = YES;
                }
                [self deleteBackward];
                self.text = [self parseString:self.text];
                
                NSInteger offset = range.location;
                if (range.location == 3 || range.location  == 8) {
                    offset ++;
                }
                if (isLast) {
                    //光标直接在最后一位了
                }else{
                    UITextPosition *newPos = [self positionFromPosition:self.beginningOfDocument offset:offset];
                    self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
                }
                
                return NO;
            }
            
            else{
                return YES;
            }
        }
        
        else if(string.length >0){
                    //限制输入字符个数
            if (([self noneSpaseString:self.text].length + string.length - range.length > 11) ) {
                return NO;
            }
            [self insertText:string];
            self.text = [self parseString:self.text];
            
            NSInteger offset = range.location + string.length;
            if (range.location == 3 || range.location  == 8) {
                offset ++;
            }
            UITextPosition *newPos = [self positionFromPosition:self.beginningOfDocument offset:offset];
            self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
            return NO;
        }else{
    
            return YES;
        }
        
    }
    
    return YES;

}
-(NSString*)noneSpaseString:(NSString*)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString*)parseString:(NSString*)string
{
    if (!string) {
        return nil;
    }
    NSMutableString* mStr = [NSMutableString stringWithString:[string stringByReplacingOccurrencesOfString:@" " withString:@""]];
    if (mStr.length >3) {
        [mStr insertString:@" " atIndex:3];
    }if (mStr.length > 8) {
        [mStr insertString:@" " atIndex:8];
        
    }
    return  mStr;
}

@end