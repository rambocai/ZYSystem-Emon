//
//  SystemHelper.h
//  SystemTest
//
//  Created by 竹雨 on 2018/4/12.
//  Copyright © 2018年 竹雨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemHelper : NSObject

/**
 * 获取UUID
 */
+ (NSString *)getUUID;

/**
 * 获取应用广告标识符 advertisingIdentifier
 */
+ (NSString *)getAdvertisingIdentifier;

/**
 * 获取标识符供应商 identifierForVendor
 */
+ (NSString *)getIdentifierForVendor;

/**
 * 获取iOS系统信息
 */
+ (NSString *)getSystemInformation;

/**
 * 获取应用信息
 */
+ (void)getApplicationInformation;

/**
 * 获取运营商信息
 */
+ (NSString *)getOperatorInfomation;


@end
