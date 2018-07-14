//
//  CSNavigationController.m
//  NewsBoardDemo
//
//  Created by student on 16/4/20.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "CSNavigationController.h"
#import "AppDelegate.h"
#import "POPSliderViewController.h"

@interface CSNavigationController ()

@end

@implementation CSNavigationController

//系统的初始化方法
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
//    bar setback
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//重写父类的push方法 设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //将push父类的方法后调是因为方便二级界面的返回标题可以自定义
    if (self.viewControllers.count >0)
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"top_navigation_back" addTarget:self action:@selector(leftBarButtonClick:)];
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"alicms" withImageName:@"" addTarget:self action:@selector(leftBtnClick:)];
        
    }
    
    [super pushViewController:viewController animated:YES];
}
- (void)leftBarButtonClick:(UIButton *)btn
{
    
    [self popViewControllerAnimated:YES];
}

/**
 导航控制器的第一级界面的左侧按钮的点击事件（做侧滑用）

 @param btn 当前的leftBarBtn
 */
- (void)leftBtnClick:(UIButton *)btn {
    NSLog(@"左侧按钮的点击事件");
    btn.selected = !btn.selected;
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (btn.selected) {
        [app.popSliderVC openDrawer];
    }else{
        [app.popSliderVC closeDrawer];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
