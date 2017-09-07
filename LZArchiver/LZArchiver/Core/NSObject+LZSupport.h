//
//  NSObject+LZSupport.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LZSupport)

/*
 @property (strong, nonatomic, readonly) NSArray<NSString *> *properties;
 @property (strong, nonatomic, readonly) NSArray<NSString *> *instanceMethods;
*/

- (NSArray<NSString *> *)lz_properties;

//- (NSArray<NSString *> *)lz_instanceMethods;



@end
