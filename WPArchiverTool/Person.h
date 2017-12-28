//
//  Person.h
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Select) (NSString *aa);

@protocol PersonDelegat<NSObject>

@end
@interface Person : NSObject<NSCoding>
{
    NSString *colorInfo;
}

@property (nonatomic, copy) NSString *name;

@property (nonatomic) NSString *address;

@property (nonatomic, weak) NSString *job;

@property (nonatomic, assign) CGRect re1;
@property (nonatomic, assign) CGSize e1;
@property (nonatomic, assign) CGPoint p1;
//
//@property (nonatomic, assign) int age;
//
//@property (nonatomic, assign) CGFloat height;
//
//@property (nonatomic, copy) NSString  *phone;
//
//@property (nonatomic, strong) NSMutableArray *arr1;
//
//@property (nonatomic, copy) NSDictionary *dic1;
//
//@property (nonatomic, strong) NSMutableDictionary *dic2;
//
//@property (nonatomic, assign) float a1;
//@property (nonatomic, assign) double a2;
//@property (nonatomic, assign) NSUInteger a3;
//@property (nonatomic, assign) NSInteger a4;
//@property (nonatomic, assign) short a5;
//@property (nonatomic, assign) BOOL a6;
//@property (nonatomic, assign) char c;
//@property (nonatomic, copy) Select block;
//@property (nonatomic, weak) id<PersonDelegat> delegate;
//@property (nonatomic, assign) long l1;
//@property (nonatomic, assign) long long l2;
//@property (nonatomic, assign) NSTimeInterval aa;
//@property (nonatomic, strong) NSMutableSet *s1;
//@property (nonatomic, strong) NSMutableData *d1;
//@property (nonatomic, strong) NSMutableString *d2;
//@property (nonatomic, strong) NSURL *url;

@end
