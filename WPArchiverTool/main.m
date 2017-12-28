//
//  main.m
//  TestRUN
//
//  Created by 吴朋 on 2017/12/28.
//  Copyright © 2017年 吴朋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPArchiverTool.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Person *per = [[Person alloc] init];
        per.name = @"哈哈";
        per.age = 10;
        per.height = 172.0;
        per.address = @"北京";
        per.job = @"工程师";
        per.phone = @"23232323232";
        [per setValue:@[@"211", @"2323232"] forKeyPath:@"friends"];
        NSLog(@"%@", [per objectDetailInfoWithPropties]);
        [per wpObjectDescript];
        [per wpArchiverObjectWithFileName:@"persion"];
        
        Person *per1 = [Person wpUnArchiverObjectWithFileName:@"persion"];
        [per1 wpObjectDescript];
    }
    return 0;
}
