//
//  SystemHelper.m
//  SystemTest
//
//  Created by 竹雨 on 2018/4/12.
//  Copyright © 2018年 竹雨. All rights reserved.
//

#import "SystemHelper.h"
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation SystemHelper

// 获取UUID
+ (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return result;
}

// 获取应用广告标识符 advertisingIdentifier
+ (NSString *)getAdvertisingIdentifier {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

// 获取标识符供应商 identifierForVendor
+ (NSString *)getIdentifierForVendor {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

// 获取iOS系统信息
+ (NSString *)getSystemInformation {
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    return [NSString stringWithFormat:@"%@%@", systemName, systemVersion];
}

// 获取应用信息
+ (void)getApplicationInformation {
    
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    //NSDictionary *infoDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    // 软件版本
    NSString *versionString = infoDic[@"CFBundleShortVersionString"];
    NSString *buildString = infoDic[@"CFBundleVersion"];
    NSLog(@"软件版本：%@，build：%@", versionString, buildString);
    
    // BundleID
    NSLog(@"BundleID = %@", infoDic[@"CFBundleIdentifier"]);
    
    // 支持的平台
    NSLog(@"支持平台 = %@", infoDic[@"CFBundleSupportedPlatforms"]);
    
    // 平台名称
    NSLog(@"平台名称 = %@", infoDic[@"DTPlatformName"]);
    
    // 平台版本
    NSLog(@"平台版本 = %@", infoDic[@"DTPlatformVersion"]);
    
    // 平台信息
    NSLog(@"平台信息 = %@", infoDic[@"DTSDKName"]);
    
    // 最低版本要求
    NSLog(@"最低版本要求 = %@", infoDic[@"MinimumOSVersion"]);
    
    // 所需CPU架构
    NSLog(@"%@", infoDic[@"UIRequiredDeviceCapabilities"]);
    
    // 支持的设备方向
    NSLog(@"设备方向 = %@", infoDic[@"UISupportedInterfaceOrientations"]);
}

// 获取运营商信息
+ (NSString *)getOperatorInfomation {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    //NSLog(@"info = %@", info);
    CTCarrier *carrier = [info subscriberCellularProvider];
    //NSLog(@"carrier = %@", carrier);
    if (carrier == nil) {
        return @"不能识别";
    }
    NSString *code = [carrier mobileNetworkCode];
    if (code == nil) {
        return @"不能识别";
    }
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) {
        return @"移动运营商";
    } else if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"]) {
        return @"联通运营商";
    } else if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"]) {
        return @"电信运营商";
    } else if ([code isEqualToString:@"20"]) {
        return @"铁通运营商";
    }
    return @"不能识别";
}


@end
