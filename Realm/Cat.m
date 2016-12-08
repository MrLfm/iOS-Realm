//
//  Cat.m
//  Realm
//
//  Created by Mr.Liu on 16/12/7.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "Cat.h"
#import <UIKit/UIKit.h>

@implementation Cat

+ (NSString *)primaryKey {
    
    return @"nickname";
}

+ (NSDictionary *)defaultPropertyValues {
    
    NSData *picture = UIImageJPEGRepresentation([UIImage imageNamed:@"miao"], 0.1);
    return @{@"picture":picture};
}
@end
