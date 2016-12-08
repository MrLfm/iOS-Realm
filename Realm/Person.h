//
//  Person.h
//  Realm
//
//  Created by Mr.Liu on 16/12/7.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import <Realm/Realm.h>
#import "Cat.h"

@interface Person : RLMObject

@property NSString   *name;
@property NSUInteger age;
@property RLMArray<Cat *><Cat> *cats;

@end
