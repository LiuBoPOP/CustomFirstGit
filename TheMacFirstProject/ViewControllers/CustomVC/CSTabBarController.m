//
//  CSTabBarController.m
//  NewsBoardDemo
//
//  Created by student on 16/4/19.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "CSTabBarController.h"
#import "CSNavigationController.h"
#import "NewViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
//#import "MediasViewController.h"

@interface CSTabBarController ()

@end

@implementation CSTabBarController

//系统的初始化方法
+ (void)initialize
{
    NSDictionary *normalDic = @{
                                NSFontAttributeName:[UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    NSDictionary *selectDic = @{
                                NSFontAttributeName:[UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName:[UIColor redColor]
                                };
    //统一设定TabBarItem的字体大小及颜色
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectDic forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NewViewController *vc1 = [[NewViewController alloc] init];
//    UIViewController *vc1 =[NSClassFromString(@"NewViewController") new];
    [self setUpChildVC:vc1 withTitle:@"新闻" withNormalImage:@"tabbar_icon_news_normal" withSelectImage:@"tabbar_icon_news_highlight"];
    
    SecondViewController *vc2 = [[SecondViewController alloc] init];
//    UIViewController *vc2 =[NSClassFromString(@"SecondViewController") new];
    [self setUpChildVC:vc2 withTitle:@"阅读" withNormalImage:@"tabbar_icon_reader_normal" withSelectImage:@"tabbar_icon_reader_highlight"];
    
    ThirdViewController *vc3 = [[ThirdViewController alloc] init];
//    UIViewController *vc3 =[NSClassFromString(@"ThirdViewController") new];
    [self setUpChildVC:vc3 withTitle:@"视频" withNormalImage:@"tabbar_icon_media_normal" withSelectImage:@"tabbar_icon_media_highlight"];
    
    FourViewController *vc4 = [[FourViewController alloc] init];
//    UIViewController *vc4 =[NSClassFromString(@"FoundViewController") new];
    [self setUpChildVC:vc4 withTitle:@"话题" withNormalImage:@"tabbar_icon_found_normal" withSelectImage:@"tabbar_icon_found_highlight"];
//
////    MediasViewController *vc5 = [[MediasViewController alloc] init];
//    UIViewController *vc5 =[NSClassFromString(@"MediasViewController") new];
//    [self setUpChildVC:vc5 withTitle:@"我" withNormalImage:@"tabbar_icon_me_normal" withSelectImage:@"tabbar_icon_me_highlight"];
}

//封装各个VC的方法
- (void)setUpChildVC:(UIViewController *)vc withTitle:(NSString *)title withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    CSNavigationController *nav = [[CSNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
-(UINavigationController *)pop_NavController{
    return self.selectedViewController;
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
