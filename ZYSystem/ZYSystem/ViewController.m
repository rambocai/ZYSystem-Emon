//
//  ViewController.m
//  ZYSystem
//
//  Created by 竹雨 on 2018/4/13.
//  Copyright © 2018年 竹雨. All rights reserved.
//

#import "ViewController.h"
#import "SystemHelper.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"uuid = %@", [SystemHelper getUUID]);
    
    NSLog(@"adId = %@", [SystemHelper getAdvertisingIdentifier]);
    
    NSLog(@"idfv = %@", [SystemHelper getIdentifierForVendor]);
    
    NSLog(@"sysInfo = %@", [SystemHelper getSystemInformation]);
    
    [SystemHelper getApplicationInformation];
    
    NSLog(@"opInfo = %@", [SystemHelper getOperatorInfomation]);
}

/**
 * 通过一个类的名称获取一个类的成员变量列表
 * @param className 类的名称
 */
- (void)getIvarListByClassName:(NSString *)className {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(NSClassFromString(className), &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *objcName = [NSString stringWithUTF8String:name];
        NSLog(@"%d : %@", i, objcName);
    }
}


@end
