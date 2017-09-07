//
//  NSObject+LZSupport.m
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "NSObject+LZSupport.h"
#import <objc/runtime.h>

@implementation NSObject (LZSupport)


- (NSArray<NSString *> *)lz_properties {

    unsigned int propertyCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    
    NSMutableArray *properties = [NSMutableArray array];
    
    for (unsigned int i = 0; i < propertyCount; i ++) {
        objc_property_t prop = propertyList[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(prop)];
        
        [properties addObject:propertyName];
    }
    
    free(propertyList);
    return properties;
}





@end
