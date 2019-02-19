//
//  NSMutableArray+InsertArray.m
//  HuoGuo
//
//  Created by zbj on 2017/1/5.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import "NSMutableArray+InsertArray.h"

@implementation NSMutableArray(InsertArray)
-(void)bj_insertArray:(NSArray *)newAdditions atIndex:(NSUInteger)index{
    if (!newAdditions||[newAdditions count]==0)return;
    if (!self) return;
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];
    for(int i =(int)index;i < newAdditions.count+index;i++){
        [indexes addIndex:i];
    }
    [self insertObjects:newAdditions atIndexes:indexes];
}
/** 数组安全的插入数据*/
-(void)bj_safeInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (!self) {return;}
    if (!anObject) {return;}
    
    if (index==0) {
        
    [self count]==0 ?[self addObject:anObject] :
                     [self insertObject:anObject atIndex:index];

        return;
    }
    
    if (index>=[self count]-1){//越界时插入最后
        [self addObject:anObject];
        
        return;
    }
}
-(void)bj_safeRemoveObjectAtIndex:(NSInteger)index{
    if (!self) {return;}
    if (index<[self count]) {
        
        [self removeObjectAtIndex:index];
    }else{
        
        NSLog(@"index大于数组count");
    }
}
@end
