
//
//  NSObject+LZSupport.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LZSupport)

// 返回该对象的所有成员变量名

- (NSArray<NSString *> *)lz_properties;

@end
