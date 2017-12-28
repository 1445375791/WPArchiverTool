//
//  NSObject+WPObjectDetail.m
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "NSObject+WPObjectDetail.h"
#import <objc/message.h>
#import "WPObjectAttributes.h"
#import "WPObjectDetailModel.h"
@implementation NSObject (WPObjectDetail)

/**
 获取类成员属性和成员变量的名（包括{ 
 定义的变量
 }）
 
 @return 成员属性和成员变量名数组
 */
- (NSMutableArray *)wpObjectAllPropertiesAndVariablesName {
    NSMutableArray *propties = @[].mutableCopy;
    // 定义变量 获取成员属性数量
    unsigned int proptiesCount = 0;
    // 获取对象的成员变量
    Ivar *ivars = class_copyIvarList([self class], &proptiesCount);
    //遍历ivars 
    for (int i = 0; i < proptiesCount; i++) {
        // 获取ivar
        Ivar ivar = ivars[i];
        //获取属性名
        const char *proptCName = ivar_getName(ivar);
        //转换成NSString
        NSString *proptStr = [NSString stringWithUTF8String:proptCName];
        [propties addObject:proptStr];
    }
    free(ivars);
    return propties;
}

/**
 获取类的成员属性(反射机制) (不包括{
 定义的变量
 })
 
 @return 属性数组
 */
- (NSMutableArray *)wpObjectAllProptiesName {
    NSMutableArray *propties = @[].mutableCopy;
    // 属性的个数
    unsigned int proptiesCount = 0;
    // 获取所有属性
    objc_property_t *propts = class_copyPropertyList([self class], &proptiesCount);
    // 遍历获取
    for (int i = 0; i < proptiesCount; i++) {
        objc_property_t proper = propts[i];
        //获取属性名
        const char *properCName = property_getName(proper);
        NSString *properString = [NSString stringWithUTF8String:properCName];
        [propties addObject:properString];
    }
    free(propts);
    return propties;
}

/**
 获取类的属性详细信息包括名称和类型等
 
 @return 详情信息数组
 */
- (NSMutableArray *)wpObjectAllPropertiesNameAndTypes {
    NSMutableArray *detailInfos = @[].mutableCopy;
    // 属性的个数
    unsigned int proptiesCount = 0;
    // 获取所有属性
    objc_property_t *propts = class_copyPropertyList([self class], &proptiesCount);
    // 遍历获取
    for (int i = 0; i < proptiesCount; i++) {
        NSMutableDictionary *typeDic = @{}.mutableCopy;
        objc_property_t proper = propts[i];
        //获取属性名
        const char *properCName = property_getName(proper);
        NSString *properString = [NSString stringWithUTF8String:properCName];
        
        // 属性描述
//        const char *propertyAtt = property_getAttributes(proper);
        unsigned int attrCount = 0;
        objc_property_attribute_t *attributs = property_copyAttributeList(proper, &attrCount);
        NSMutableDictionary *detailDic = @{}.mutableCopy;
        // 遍历属性
        for (int j = 0; j < attrCount; j++) {
            objc_property_attribute_t attr = attributs[j];
            const char *name = attr.name;
            NSString *nameString = [NSString stringWithUTF8String:name];
            const char *value = attr.value;
            NSString *valueString = [NSString stringWithUTF8String:value];
            NSLog(@"%@ %@", nameString, valueString);
            NSDictionary *dic = [WPObjectAttributes objectAttributeInfoWithName:nameString typeInfo:valueString andAttrIndex:j];
            [detailDic addEntriesFromDictionary:dic];
        }
        free(attributs);
        NSLog(@"%@ \n", properString);
        
        [typeDic setObject:[WPObjectDetailModel initObjectAttributeModel:detailDic] forKey:properString];
//        [typeDic setObject:detailDic forKey:properString];
        [detailInfos addObject:typeDic];
    }
    free(propts);
    
    return detailInfos;
}

/**
 打印对象信息
 */
- (void)wpObjectDescript {
    NSMutableString *descriStr = [NSMutableString string];
    NSMutableArray *proptis = [self wpObjectAllPropertiesAndVariablesName];
    for (NSString *proKey in proptis) {
        NSString *info = [NSString stringWithFormat:@" %@:%@ ", proKey, [self valueForKeyPath:proKey]];
        [descriStr appendString:info];
    }
    NSLog(@"%@", descriStr);
}


@end
