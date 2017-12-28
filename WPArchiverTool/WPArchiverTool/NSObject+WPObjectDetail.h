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
 获取类成员属性和成员变量的名（包括{ 
 定义的变量
 }）
 
 @return 成员属性和成员变量名数组
 */
- (NSMutableArray *)wpObjectAllPropertiesAndVariablesName;

/**
 获取类的成员属性(反射机制) 不包括{定义的变量}

 @return 属性数组
 */
- (NSMutableArray *)wpObjectAllProptiesName;


/**
 获取类的属性详细信息包括名称和类型等

 @return 详情信息数组
 */
- (NSMutableArray *)wpObjectAllPropertiesNameAndTypes;

/**
 打印对象信息
 */
- (void)wpObjectDescript;

@end
