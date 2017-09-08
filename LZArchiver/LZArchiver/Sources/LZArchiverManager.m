//
//  LZArchiverManager.m
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import "LZArchiverManager.h"
#import "LZArchiverConst.h"

@implementation LZArchiverManager

+ (void)clearAll {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager changeCurrentDirectoryPath: KDOCUMENT_PATH];
    
    NSError *error = nil;
    [fileManager removeItemAtPath:LZFolder error:&error];
    NSAssert(error == nil, @"Delete failed");
}

+ (void)clear:(NSString *)className {
    
    NSAssert(className.length != 0, @"Class name cannot be empty");
    
    NSString *arciverPath = [KDOCUMENT_PATH stringByAppendingPathComponent:LZFolder];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager changeCurrentDirectoryPath:arciverPath];
    
    NSError *error = nil;
    NSArray *filenames = [fileManager contentsOfDirectoryAtPath:arciverPath error:&error];
    NSAssert(filenames.count != 0, @"Not match to the file");
    NSAssert(error == nil, @"Select failed");
    
    for (NSString *filename in filenames) {
        if ([filename hasPrefix:className]) {
            NSError *rmError = nil;
            [fileManager removeItemAtPath:filename error:&rmError];
            NSAssert(rmError == nil, @"Delete failed");
        }
    }
}

+ (void)clear:(NSString *)className withName:(NSString *)name {
    
    NSString *arciverPath = [KDOCUMENT_PATH stringByAppendingPathComponent:LZFolder];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager changeCurrentDirectoryPath:arciverPath];
    
    NSString *filePath = [NSString stringWithFormat:@"%@_%@.archiver", className, name];
    
    NSError *error = nil;
    [fileManager removeItemAtPath:filePath error:&error];
    NSAssert(error == nil, @"Delete faild");
}


@end
