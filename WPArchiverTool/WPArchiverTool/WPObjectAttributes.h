//
//  WPObjectAttributes.h
//  WPArchiverTool
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPObjectAttributes : NSObject


/**
 根据属性描述名字和值创造字典数据
 
 @param name 描述的名称
 @param typeInfo 描述的值
 @param index 属性标记位置
 @return 字典数据
 */
+ (NSDictionary *)objectAttributeInfoWithName:(NSString *)name typeInfo:(NSString *)typeInfo andAttrIndex:(int)index;

@end
