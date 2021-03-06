//
//  NSObject+LZArchiver.m
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "NSObject+LZArchiver.h"
#import "NSObject+LZSupport.h"
#import "LZArchiverConst.h"

@implementation NSObject (LZArchiver)

- (BOOL)lz_archiverWithName:(NSString *)name {
    
    NSAssert(name.length != 0, @"File name cannot be empty");
    
    NSString *filePath = [[self class] createPathWithName:name];
    
    [[self class] createArchiverFolder];
    
    return [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}


+ (id)lz_unArchiverWithName:(NSString *)name {
    
    NSAssert(name.length != 0, @"File name cannot be empty");
    
    NSString *filePath = [[self class] createPathWithName:name];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}


+ (NSString *)createPathWithName:(NSString *)name {
    
    NSString *path = [NSString stringWithFormat:@"%@/%@_%@.archiver",LZFolder, NSStringFromClass([self class]), name];
    
    return [KDOCUMENT_PATH stringByAppendingPathComponent: path];
}


+ (void)createArchiverFolder {
    
    NSString *folderPath = [KDOCUMENT_PATH stringByAppendingPathComponent:LZFolder];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:folderPath]) {
        
        BOOL cmp = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        NSAssert(cmp, @"Archive folder to create a failure");
    }
}

// encoding + decoding
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSArray *properties = [self lz_properties];
    for (NSString * property in properties) {
        [self setValue:[aDecoder decodeObjectForKey:property] forKey:property];
    }
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
