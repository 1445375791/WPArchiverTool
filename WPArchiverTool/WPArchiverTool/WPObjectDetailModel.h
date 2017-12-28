//
//  WPObjectDetailModel.h
//  WPArchiverTool
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

// 类型
typedef NS_ENUM(NSUInteger, WPObjectPropertyType) {
    WPObjectPropertyTypeUnknow,
    WPObjectPropertyTypeShort,
    WPObjectPropertyTypeCharOrBool,
    WPObjectPropertyTypeInt,
    WPObjectPropertyTypeFloat,
    WPObjectPropertyTypeDouble,
    WPObjectPropertyTypeNSInteger,
    WPObjectPropertyTypeNSUInteger,
    WPObjectPropertyTypeNSString,
    WPObjectPropertyTypeNSMutableString,
    WPObjectPropertyTypeNSNumber,
    WPObjectPropertyTypeNSArray,
    WPObjectPropertyTypeNSMutableArray,
    WPObjectPropertyTypeNSDictory,
    WPObjectPropertyTypeNSMutableDictionary,
    WPObjectPropertyTypeNSSet,
    WPObjectPropertyTypeNSMutableSet,
    WPObjectPropertyTypeNSData,
    WPObjectPropertyTypeNSMutableData,
    WPObjectPropertyTypeNSURL,
    WPObjectPropertyTypeNSDate,
    WPObjectPropertyTypeBlock,
    WPObjectPropertyTypeDelegate,
    WPObjectPropertyTypeOtherNSType,
    WPObjectPropertyTypeCGRect,
    WPObjectPropertyTypeCGSize,
    WPObjectPropertyTypeCGPoint,
    WPObjectPropertyTypeOtherCGType,
};

// 编码类型
typedef NS_ENUM(NSUInteger, WPObjectEncodingType) {
    WPObjectEncodingTypeUnknow,
    WPObjectEncodingTypeCopy,
    WPObjectEncodingTypeStrong,
    WPObjectEncodingTypeWeak,
    WPObjectEncodingTypeAssign,
    WPObjectEncodingTypeRetain,
};

//原子性
typedef NS_ENUM(NSUInteger, WPObjectAtomicType) {
    WPObjectAtomicTypeNonatomic,
    WPObjectAtomicTypeAtomic,
};


@interface WPObjectDetailModel : NSObject

/**
 对象属性的类型
 */
@property (nonatomic, assign) WPObjectPropertyType propertyType;

/**
 类型的名称
 */
@property (nonatomic, copy) NSString *propertyTypeName;

/**
 编码类型
 */
@property (nonatomic, assign) WPObjectEncodingType encodingType;

/**
 编码名称
 */
@property (nonatomic, copy) NSString *encodingTypeName;

/**
 原子性类型
 */
@property (nonatomic, assign) WPObjectAtomicType atomicType;

/**
 原子性名称
 */
@property (nonatomic, copy) NSString *atomicTypeName;

/**
 属性名
 */
@property (nonatomic, copy) NSString *proptyName;

/**
 根据字典数据创建对象详情对象

 @param attributesDic 字典数据
 @return 对象
 */
+ (instancetype)initObjectAttributeModel:(NSDictionary *)attributesDic;

@end
