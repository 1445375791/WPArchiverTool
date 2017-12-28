//
//  Person.h
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
{
    NSString *colorInfo;
}

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, weak) NSString *job;

@property (nonatomic, assign) int age;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, copy) NSString  *phone;


@end
