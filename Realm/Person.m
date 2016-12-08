//
//  Person.m
//  Realm
//
//  Created by Mr.Liu on 16/12/7.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "Person.h"

@implementation Person

// 设置主键
+ (NSString *)primaryKey {
    
    return @"name";
}

// 忽略属性
+ (NSArray<NSString *> *)ignoredProperties {
    
    return @[@"age"];
}

@end
