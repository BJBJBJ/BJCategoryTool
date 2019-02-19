//
//  NSDictionary+safeObjectForKey.m
//  ZCTrafficPackage
//
//  Created by zbj-mac on 16/5/5.
//  Copyright © 2016年 zbj. All rights reserved.
//

#import "NSDictionary+safeObjectForKey.h"

#define CheckNull(value) value==[NSNull null]?nil:value

@implementation NSDictionary (safeObjectForKey)

-(id)safeObjectForKey:(NSString*)key{

    return CheckNull([self objectForKey:key]);
}
-(id)safeValueForKey:(NSString*)key{
    
    return CheckNull([self valueForKey:key]);
}

-(id)safeValueForKeyPath:(NSString *)keyPath{
    return CheckNull([self valueForKeyPath:keyPath]);
}
@end
