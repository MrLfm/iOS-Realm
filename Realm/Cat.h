//
//  Cat.h
//  Realm
//
//  Created by Mr.Liu on 16/12/7.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import <Realm/Realm.h>

@interface Cat : RLMObject

@property NSString *nickname;
@property NSData   *picture;

@end

RLM_ARRAY_TYPE(Cat)