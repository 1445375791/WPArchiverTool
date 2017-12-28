//
//  WPObjectDetailModel.m
//  WPArchiverTool
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "WPObjectDetailModel.h"
#import "NSObject+WPObjectDetail.h"

@implementation WPObjectDetailModel

/**
 根据字典数据创建对象详情对象
 
 @param attributesDic 字典数据
 @return 对象
 */
+ (instancetype)initObjectAttributeModel:(NSDictionary *)attributesDic {
    WPObjectDetailModel *model = [[WPObjectDetailModel alloc] init];
    NSDictionary *typeDic = [self objectPropertyTypeWithString:attributesDic[@"propertyType"]];
    model.propertyType = [[typeDic.allValues firstObject] integerValue];
    model.propertyTypeName = [typeDic.allKeys firstObject];
    
    NSDictionary *encodingDic = [self objectPropertyEncodingWithString:attributesDic[@"propertyEncode"]];
    model.encodingType = [[encodingDic.allValues firstObject] integerValue];
    model.encodingTypeName = [encodingDic.allKeys firstObject];
    
    NSDictionary *atomicDic = [self objectPropertyAtomicWithString:attributesDic[@"propertyAtomic"]];
    model.atomicType = [[atomicDic.allValues firstObject] integerValue];
    model.atomicTypeName = [atomicDic.allKeys firstObject];
    model.proptyName = attributesDic[@"propertyName"];
    return model;
}


#pragma mark - private
/**
 根据type转换成可读的属性类型
 
 @param type 属性类型
 @return 可读化类型
 */
+ (NSDictionary<NSString *, NSNumber *> *)objectPropertyTypeWithString:(NSString *)type {
    NSString *typeInfo;
    WPObjectPropertyType propertyType = WPObjectPropertyTypeUnknow;
    if ([type hasPrefix:@"@"]) {
        typeInfo = [[type substringFromIndex:1] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    } else {
        typeInfo = @"unknow";
    }
    NSString *showType;
    if ([typeInfo isEqualToString:@"NSArray"]) {
        propertyType = WPObjectPropertyTypeNSArray;
        showType = @"WPObjectPropertyTypeNSArray";
    } else if ([typeInfo isEqualToString:@"NSString"]) {
        propertyType = WPObjectPropertyTypeNSString;
        showType = @"WPObjectPropertyTypeNSString";
    } else if ([typeInfo isEqualToString:@"NSNumber"]) {
        propertyType = WPObjectPropertyTypeNSNumber;
        showType = @"WPObjectPropertyTypeNSNumber";
    } else {
        propertyType = WPObjectPropertyTypeUnknow;
        showType = @"WPObjectPropertyTypeUnknow";
    }
    
    return @{showType : [NSNumber numberWithInteger:propertyType]};
}

/**
 根据type转换成可读的编码类型
 
 @param type 编码类型
 @return 可读化类型
 */
+ (NSDictionary<NSString *, NSNumber *> *)objectPropertyEncodingWithString:(NSString *)type {
    NSString *encodingStr;
    WPObjectEncodingType encodingType;
    if ([type isEqualToString:@"C"]) {
        encodingStr = @"WPObjectEncodingTypeCopy";
        encodingType = WPObjectEncodingTypeCopy;
    } else if ([type isEqualToString:@"&"]) {
        encodingStr = @"WPObjectEncodingTypeStrong";
        encodingType = WPObjectEncodingTypeStrong;
    } else if ([type isEqualToString:@"W"]) {
        encodingStr = @"WPObjectEncodingTypeWeak";
        encodingType = WPObjectEncodingTypeWeak;
    } else {
        encodingStr = @"WPObjectEncodingTypeUnknow";
        encodingType = WPObjectEncodingTypeUnknow;
    }
    return @{encodingStr: [NSNumber numberWithInteger:encodingType]};
}

/**
 根据type转换成可读的原子类型
 
 @param type 原子类型
 @return 可读化类型
 */
+ (NSDictionary<NSString *, NSNumber *> *)objectPropertyAtomicWithString:(NSString *)type {
    NSString *atomicStr;
    WPObjectAtomicType atomicType;
    
    if ([type isEqualToString:@"N"]) {
        atomicStr = @"WPObjectAtomicTypeNonatomic";
        atomicType = WPObjectAtomicTypeNonatomic;
    } else {
        atomicStr = @"WPObjectAtomicTypeAtomic";
        atomicType = WPObjectAtomicTypeAtomic;
    }
    return @{atomicStr : [NSNumber numberWithInteger:atomicType]};
}

- (NSString *)description {    
    return [NSString stringWithFormat:@"propertyTypeName: %@   encodingTypeName: %@  atomicTypeName:  %@  proptyName: %@", _propertyTypeName, _encodingTypeName, _atomicTypeName, _proptyName];
    
}

@end
