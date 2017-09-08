//
//  Test.h
//  LZArchiver
//
//  Created by Scott on 2017/9/8.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;

@interface Test : NSObject

@property (copy, nonatomic) NSString *str;
@property (copy, nonatomic) NSArray *arr;
@property (copy, nonatomic) NSDictionary *dic;
@property (copy, nonatomic) NSData *data;
@property (copy, nonatomic) NSSet *set;
@property (strong, nonatomic) NSMutableString *mStr;
@property (strong, nonatomic) NSMutableArray *mArr;
@property (strong, nonatomic) NSMutableDictionary *mDic;
@property (strong, nonatomic) NSMutableData *mData;
@property (strong, nonatomic) NSMutableSet *mSet;

@property (assign, nonatomic) NSInteger _integer;
@property (assign, nonatomic) NSUInteger _uInteger;
@property (assign, nonatomic) CGFloat _cgFloat;
@property (assign, nonatomic) BOOL _bool;
@property (assign, nonatomic) int _int;
@property (assign, nonatomic) float _float;
@property (assign, nonatomic) double _double;

@property (strong, nonatomic) Person *person;

@end

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;

@end
