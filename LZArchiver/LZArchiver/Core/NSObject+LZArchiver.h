//
//  NSObject+LZArchiver.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LZArchiver)

- (BOOL)lz_archiverWithName:(NSString *)name;

+ (id)lz_unArchiverWithName:(NSString *)name;

@end
