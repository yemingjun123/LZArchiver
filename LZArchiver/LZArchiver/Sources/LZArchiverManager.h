//
//  LZArchiverManager.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZArchiverManager : NSObject

/**
  清除所有的归档
 */
+ (void)clearAll;

/**
  清除一个类别的归档
 
 @param className 类别名
 */
+ (void)clear:(NSString *)className;

/**
   清除一个 类别 && 归档对象的名字的归档

 @param className 类别的名字
 
 @param name      归档对象的名字
 */
+ (void)clear:(NSString *)className withName:(NSString *)name;

@end
