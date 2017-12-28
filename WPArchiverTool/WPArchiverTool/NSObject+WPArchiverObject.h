//
//  NSObject+WPArchieveObject.h
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WPArchiverObject)


/**
 对象进行归档

 @param aCoder acoder
 */
- (void)wpEncodeObjectWithCoder:(NSCoder *)aCoder;

/**
 对象解档

 @param aDecoder acoder
 */
- (void)wpDecoderObjectWithCoder:(NSCoder *)aDecoder;

/**
 根据文件名归档对象
 @return 是否归档成功
 */
- (BOOL)wpArchiverObjectWithFileName:(NSString *)fileName;


/**
 根据文件名获取归档的信息

 @param fileName 文件名
 @return 对象
 */
+ (id)wpUnArchiverObjectWithFileName:(NSString *)fileName;

@end
