//
//  NSObject+WPArchieveObject.m
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "NSObject+WPArchiverObject.h"
#import "NSObject+WPObjectDetail.h"

@implementation NSObject (WPArchiverObject)

/**
 对象进行归档
 
 @param aCoder acoder
 */
- (void)wpEncodeObjectWithCoder:(NSCoder *)aCoder {
    NSMutableArray *propties = [self wpObjectAllPropertiesAndVariablesName];
    for (NSString *propt in propties) {
        [aCoder encodeObject:[self valueForKeyPath:propt] forKey:propt];
    }
}

/**
 对象解档
 
 @param aDecoder acoder
 */
- (void)wpDecoderObjectWithCoder:(NSCoder *)aDecoder {
    NSMutableArray *propties = [self wpObjectAllPropertiesAndVariablesName];
    for (NSString *propt in propties) {
        [self setValue:[aDecoder decodeObjectForKey:propt] forKeyPath:propt];
    }
}

/**
 根据文件名归档对象
 @return 是否归档成功
 */
- (BOOL)wpArchiverObjectWithFileName:(NSString *)fileName {
    NSString *savePath = [[self class] getWpArchiverObjectFilePath:fileName];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiever = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiever encodeObject:self forKey:fileName];
    [archiever finishEncoding];
    return [data writeToFile:savePath atomically:YES];
}


/**
 根据文件名获取归档的信息
 
 @param fileName 文件名
 @return 对象
 */
+ (id)wpUnArchiverObjectWithFileName:(NSString *)fileName {
    NSString *filePath = [self getWpArchiverObjectFilePath:fileName];
    NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unArchiever = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id object = [unArchiever decodeObjectForKey:fileName];
    [unArchiever finishDecoding];
    return object;
}

#pragma mark - private

/**
 根据文件名获取文件路径

 @param fileName 文件名
 @return 文件路径
 */
+ (NSString *)getWpArchiverObjectFilePath:(NSString *)fileName {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.archieve", fileName]];
    return filePath;
}

@end
