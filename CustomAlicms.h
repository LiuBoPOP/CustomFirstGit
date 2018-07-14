//
//  CustomAlicms.h
//  CustomAlicms
//
//  Created by 刘波 on 2018/6/4.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface CustomAlicms : NSObject
+ (NSString *)md5:(NSString *)string;
@end
