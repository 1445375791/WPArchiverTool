//
//  Person.m
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import "Person.h"
#import "WPArchiverTool.h"
@interface Person ()
{
    NSString *_classInfo;
}
@property (nonatomic, copy) NSArray *friends;
@end
@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [self wpDecoderObjectWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self wpEncodeObjectWithCoder:aCoder];
}

@end
