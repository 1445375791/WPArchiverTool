//
//  NSObject+WPObjectDetail.h
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WPObjectDetail)

/**
  获取对象的所有属性（包括.m中定义的）

 @return 成员变量数组
 */
- (NSMutableArray *)objectDetailInfoWithPropties;


/**
 打印对象信息
 */
- (void)wpObjectDescript;

@end
