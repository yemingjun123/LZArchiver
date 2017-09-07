//
//  NSObject+LZArchiver.m
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "NSObject+LZArchiver.h"
#import "NSObject+LZSupport.h"

@implementation NSObject (LZArchiver)

- (BOOL)lz_archiverWithName:(NSString *)name {
    return NO;
}


+ (id)lz_unArchiverWithName:(NSString *)name {
    return nil;
}


+ (NSString *)createPathWithName:(NSString *)name {
    return nil;
}


+ (void)createFileWithPath:(NSString *)path {
    
}

// encoding + decoding
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    return self;
}

#pragma clang diagnostic pop

- (void)encodeWithCoder:(NSCoder *)coder {
    NSArray *properties = [self lz_properties];

    for (NSString * property in properties) {
        [coder encodeObject:[self valueForKey:property] forKey:property];
    }
}



@end
