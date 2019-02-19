//
//  NSMutableArray+InsertArray.h
//  HuoGuo
//
//  Created by zbj on 2017/1/5.
//  Copyright © 2017年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(InsertArray)
/** 可变数组中指定位置插入数组*/
-(void)bj_insertArray:(NSArray *)newAdditions atIndex:(NSUInteger)index;
/** 数组安全的插入数据(index大于count时插入最后)*/
-(void)bj_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
/** 根据索引安全删除object*/
-(void)bj_safeRemoveObjectAtIndex:(NSInteger)index;
@end
