//
//  LZArchiverManager.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZArchiverManager : NSObject

- (void)clearAll;

- (void)clear:(NSString *)className;

- (void)clear:(NSString *)className withFileName:(NSString *)name;

@end
