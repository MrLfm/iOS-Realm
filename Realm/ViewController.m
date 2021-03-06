//
//  ViewController.m
//  Realm
//
//  Created by Mr.Liu on 16/12/7.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Cat.h"
#import <Realm/Realm.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testRealm];
}

- (void)testRealm {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSLog(@"默认数据库路径：%@",config.fileURL);
    
    Cat *cat1 = [[Cat alloc] initWithValue:@{@"nickname":@"miao1"}];
    Cat *cat2 = [[Cat alloc] initWithValue:@{@"nickname":@"miao2"}];
    Cat *cat3 = [[Cat alloc] initWithValue:@{@"nickname":@"miao3"}];
    Cat *cat4 = [[Cat alloc] initWithValue:@{@"nickname":@"miao4"}];

    // 创建方法1 单个属性赋值
    Person *person1 = [[Person alloc] init];
    person1.name = @"XiaoMing";
    [person1.cats addObject:cat1];
    [person1.cats addObject:cat2];
    
    // 创建方法2 initWithValue
    Person *person2 = [[Person alloc] initWithValue:@{@"name":@"XiaoLi"}];
    [person2.cats addObject:cat3];
    [person2.cats addObject:cat4];

    // 默认数据库
    RLMRealm *realm = [RLMRealm defaultRealm];
    
#pragma mark ----------增/改----------
    // 执行数据库操作方法1
    [realm transactionWithBlock:^{
        // 更改时根据主键判断
        [realm addOrUpdateObject:person1];
        [realm addOrUpdateObject:person2];
        [realm addOrUpdateObject:cat1];
        [realm addOrUpdateObject:cat2];
        [realm addOrUpdateObject:cat3];
        [realm addOrUpdateObject:cat4];

    }];
    
#pragma mark ----------查询----------
    
    // 1 根据条件查询(可选根据属性排序)
    RLMResults<Person *> *persons = [[Person objectsWhere:@"name = 'XiaoLi'"] sortedResultsUsingProperty:@"name" ascending:YES];
    NSLog(@"条件查询：%@",persons);
    
    // 2 根据主键查询
    Person *thePerson = [Person objectForPrimaryKey:@"XiaoMing"];
    NSLog(@"主键查询：%@",thePerson);
    
    // 3 NSPredicate查询（查询nickname以miao开头的Cat）
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nickname BEGINSWITH %@",@"miao"];
    RLMResults<Cat *> *cats = [Cat objectsWithPredicate:predicate];
    NSLog(@"Predicate查询：%@",cats);
    
    // 4 指定数据库查询
//    RLMResults<Cat *> realmCats = [Cat objectsInRealm:oneRealm where:@"nickname = 'miao1'"];
//    NSLog(@"指定数据库查询：%@",realmCats);
    
#pragma mark ----------查询结果的使用，类似NSArray----------
    // 遍历查询结果
    for (Cat *cat in cats) {
        
        NSLog(@"猫咪昵称：%@",cat.nickname);
    }
    // 查询结果的第一个元素
    Cat *firstCat = [cats firstObject];
    NSLog(@"查询到的第一个猫咪：%@",firstCat);
    // 或
//    Cat *firstCat = cats[0];
    // 查询结果的最后一个元素
    Cat *lastCat  = [cats lastObject];
    NSLog(@"查询到的最后一个猫咪：%@",lastCat);

#pragma mark ----------删----------
    
    // 执行数据库操作方法2
    [realm beginWriteTransaction];
//    [realm deleteObject:person1];
//    [realm deleteAllObjects];
    [realm commitWriteTransaction];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
