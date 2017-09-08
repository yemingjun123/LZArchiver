//
//  LZArchiverTests.m
//  LZArchiverTests
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Test.h"
@import LZArchiver;

@interface LZArchiverTests : XCTestCase

@end

@implementation LZArchiverTests

- (void)setUp {
    [super setUp];
}

- (void)testExample {
 
    Test *test = [[Test alloc] init];
    
    test.str = @"str";
    NSMutableString *mStr = [NSMutableString stringWithString:test.str];
    test.mStr = mStr;
    
    test.arr = @[@"1",@"2"];
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:test.arr];
    test.mArr = mArr;
    
    test.dic = @{ @"key" : @"value"};
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:test.dic];
    test.mDic = mDic;
    
    test.data = [test.str dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mData = [NSMutableData dataWithData:test.data];
    test.mData = mData;
    
    test.set = [NSSet setWithObjects:@"1",@"2", nil];
    NSMutableSet *mSet = [NSMutableSet setWithSet:test.set];
    test.mSet = mSet;
    
    test._integer = -1;
    test._uInteger = 22;
    test._cgFloat = 2.3;
    test._bool = YES;
    test._int = 1;
    test._float = 5.4;
    test._double = 2.44;
    
    Person *person = [[Person alloc] init];
    person.name = @"scott";
    test.person = person;
    
    // 归档
    BOOL cmp1 = [test lz_archiverWithName:@"test"];
    XCTAssertTrue(cmp1, @"归档失败");
    
    BOOL cmp2 = [test lz_archiverWithName:@"test1"];
    XCTAssertTrue(cmp2, @"归档失败");
    
    BOOL cmp3 = [person lz_archiverWithName:@"person"];
    XCTAssertTrue(cmp3, @"归档失败");
    // 解档
    Test *test2 = [Test lz_unArchiverWithName:@"test"];

    XCTAssertTrue([test2.mStr isEqualToString:test.mStr]);
    XCTAssertTrue([test2.str isEqualToString:test.str]);
    XCTAssertTrue([test2.mArr isEqual:test.mArr]);
    XCTAssertTrue([test2.arr isEqual:test.arr]);
    XCTAssertTrue([test2.mDic isEqual:test.mDic]);
    XCTAssertTrue([test2.dic isEqual:test.dic]);
    XCTAssertTrue([test2.mData isEqual:test.data]);
    XCTAssertTrue([test2.data isEqual:test.data]);
    XCTAssertTrue([test2.mSet isEqual:mSet]);
    XCTAssertTrue([test2.set isEqual:test.set]);
    
    XCTAssertTrue(test2._integer == test._integer);
    XCTAssertTrue(test2._uInteger == test._uInteger);
    XCTAssertTrue(test2._cgFloat == test._cgFloat);
    XCTAssertTrue(test2._bool == test._bool);
    XCTAssertTrue(test2._int == test._int);
    XCTAssertTrue(test2._float == test._float);
    XCTAssertTrue(test2._double == test._double);
    
    XCTAssertTrue([test2.person.name isEqualToString:test.person.name]);
    
    // 清除归档
    [LZArchiverManager clear:NSStringFromClass([Person class])];
    Person *up = [Person lz_unArchiverWithName:@"person"];
    NSAssert(up == nil, @"failed");
    
    [LZArchiverManager clear:NSStringFromClass([Test class]) withName:@"test1"];
    Test *utest = [Test lz_unArchiverWithName:@"test"];
    Test *utest1 = [Test lz_unArchiverWithName:@"test1"];
    NSAssert(utest1 == nil, @"failed");
    NSAssert(utest != nil, @"failed");
    
    [LZArchiverManager clearAll];
    Test *uuTest = [Test lz_unArchiverWithName:@"test"];
    NSAssert(uuTest == nil, @"failed");
 }


@end
