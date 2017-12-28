//
//  NSObject+WPObjectDetail.m
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "NSObject+WPObjectDetail.h"
#import <objc/message.h>

@implementation NSObject (WPObjectDetail)

/**
 获取对象的所有属性（包括.m中定义的）
 
 @return 成员变量数组
 */
- (NSMutableArray *)objectDetailInfoWithPropties {
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
 打印对象信息
 */
- (void)wpObjectDescript {
    NSMutableString *descriStr = [NSMutableString string];
    NSMutableArray *proptis = [self objectDetailInfoWithPropties];
    for (NSString *proKey in proptis) {
        NSString *info = [NSString stringWithFormat:@" %@:%@ ", proKey, [self valueForKeyPath:proKey]];
        [descriStr appendString:info];
    }
    NSLog(@"%@", descriStr);
}


@end
