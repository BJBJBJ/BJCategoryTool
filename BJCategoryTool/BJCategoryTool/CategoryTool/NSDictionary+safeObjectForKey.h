//
//  NSDictionary+safeObjectForKey.h
//  ZCTrafficPackage
//
//  Created by zbj-mac on 16/5/5.
//  Copyright © 2016年 zbj. All rights reserved.
//

#import <Foundation/Foundation.h>
//对 value进行  [NSNull null]判断  空值置为nil 
@interface NSDictionary (safeObjectForKey)

-(id)safeObjectForKey:(NSString*)key;

-(id)safeValueForKey:(NSString*)key;

-(id)safeValueForKeyPath:(NSString*)keyPath;


@end
