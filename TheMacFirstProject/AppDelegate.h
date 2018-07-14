//
//  AppDelegate.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/3/23.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POPSliderViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) BOOL isEable;

@property (nonatomic,strong)POPSliderViewController *popSliderVC;

@end

