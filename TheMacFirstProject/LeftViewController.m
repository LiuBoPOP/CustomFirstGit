//
//  LeftViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/12.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftNextViewController.h"
#import "AppDelegate.h"
#import "QYSDK.h"

BOOL g_isDefault;
int64_t    g_groupId;
int64_t    g_staffId;
int64_t    g_questionId;
BOOL    g_openRobotInShuntMode;

@interface LeftViewController ()<QYConversationManagerDelegate>
@property (nonatomic,strong)UIButton *nextBtn;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"个人中心";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    [self createSubViews];
}
- (void)createSubViews{
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).with.offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
}









- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"联系客服" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setBackgroundColor:[UIColor purpleColor]];
        [_nextBtn addTarget:self action:@selector(nexrtBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
- (void)nexrtBtnClick:(UIButton *)sender {
    NSLog(@"下一页转本跳转");
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    app.popSliderVC.typeBlock(@"LeftNextViewController");
//    LeftNextViewController *leftNextVC = [[LeftNextViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:leftNextVC];
//    [UIView animateWithDuration:0.5 animations:^{
//        nav.view.x = 0;
//        nav.view.y = 0;
//        nav.view.width = kScreenWidth;
//        nav.view.height = kScreenHeight;
//
//    }];
//    [self.view addSubview:nav.view];
//    [self addChildViewController:nav];
    [self onChat];
}
- (void)onChat{
    QYSource *source = [[QYSource alloc] init];
    source.title =  @"Alicms 客服";
    source.urlString = @"https://8.163.com/";
    
    
    QYSessionViewController *sessionViewController = [[QYSDK sharedSDK] sessionViewController];
//    sessionViewController.delegate = self;
    sessionViewController.sessionTitle = @"Alicms客服";
    sessionViewController.source = source;
    sessionViewController.groupId = g_groupId;
    sessionViewController.staffId = g_staffId;
    sessionViewController.commonQuestionTemplateId = g_questionId;
    sessionViewController.openRobotInShuntMode = g_openRobotInShuntMode;
    g_groupId = 0;
    g_staffId = 0;
//    BOOL showTabbar = [[NSUserDefaults standardUserDefaults] boolForKey:@"YSFDemoOnShowTabbar"];
    sessionViewController.hidesBottomBarWhenPushed = YES;
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        app.popSliderVC.typeBlock(sessionViewController);
    
    
    
//    if (showTabbar) {
//        sessionViewController.hidesBottomBarWhenPushed = NO;
//        [[QYSDK sharedSDK] customUIConfig].bottomMargin = self.tabBarController.tabBar.ysf_frameHeight;
//    }
//    else {
//        [[QYSDK sharedSDK] customUIConfig].bottomMargin = 0;
//    }
    //如果您的代码要求所有viewController继承某个公共基类，并且公共基类对UINavigationController统一做了某些处理，
    //或者对UINavigationController做了自己的扩展，并且这会导致无法正常集成，
    //或者其他原因导致使用第一种方式集成会有问题，这些情况下，建议您使用第二种方式集成。
//    if (g_isDefault) {
//        //集成方式一
//        [self.navigationController pushViewController:sessionViewController animated:YES];
//    }
//    else {
//        //集成方式二
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sessionViewController];
//        sessionViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(onBack:)];
//        [self presentViewController:nav animated:YES completion:nil];
//    }
    
//    if ([[QYSDK sharedSDK] customUIConfig].rightBarButtonItemColorBlackOrWhite == NO) {
//        sessionViewController.navigationController.navigationBar.translucent = NO;
//        NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
//        sessionViewController.navigationController.navigationBar.titleTextAttributes = dict;
//        [sessionViewController.navigationController.navigationBar setBarTintColor:YSFRGB(0x62a8ea)];
//    }
//    else {
//        sessionViewController.navigationController.navigationBar.translucent = YES;
//        NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
//        sessionViewController.navigationController.navigationBar.titleTextAttributes = dict;
//        [sessionViewController.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    }
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
