//
//  NSObject+LZArchiver.h
//  LZArchiver
//
//  Created by Scott on 2017/9/7.
//  Copyright © 2017年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LZArchiver)

/**
  自定义名字归档
 
 @param  name 文件名
 
 @return 是否成功
 */
- (BOOL)lz_archiverWithName:(NSString *)name;


/**
  通过名字解档
 
 @param  name 名字
 
 @return 解档对象
 */
+ (id)lz_unArchiverWithName:(NSString *)name;

@end
