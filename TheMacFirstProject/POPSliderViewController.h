//
//  POPSliderViewController.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/12.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POPSliderViewController : UIViewController
@property (nonatomic,copy)void(^typeBlock)(UIViewController *VC);
+ (instancetype)initWithLeftViewController:(UIViewController *)leftVC andMainVC:(UIViewController *)mainVC;
//打开抽屉
- (void)openDrawer;
- (void)openDrawerWithAnimation:(BOOL)animation;
//关闭抽屉
- (void)closeDrawer;
@end
