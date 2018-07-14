//
//  POPSliderViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/12.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "POPSliderViewController.h"
#import "CSNavigationController.h"
#import "CSTabBarController.h"

@interface POPSliderViewController ()
@property (nonatomic,strong)UIViewController *leftVC;
@property (nonatomic,strong)UIViewController *mainVC;
@property (nonatomic,strong)UIView *maskView;
@end

@implementation POPSliderViewController
+ (instancetype)initWithLeftViewController:(UIViewController *)leftVC andMainVC:(UIViewController *)mainVC{
    return [[POPSliderViewController alloc] initWithLeftVC:leftVC andMainVC:mainVC];
}
- (instancetype)initWithLeftVC:(UIViewController *)leftVC andMainVC:(UIViewController *)mainVC{
    self = [super init];
    if (self) {
        self.leftVC = leftVC;
        self.mainVC = mainVC;
        [self setup];
    }
    return self;
}

- (void)setup{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.leftVC];
    nav.navigationBar.barTintColor = [UIColor greenColor];
    [self.view addSubview:nav.view];
    [self.view addSubview:self.mainVC.view];
    [self.mainVC.view addSubview:self.maskView];
    [self addChildViewController:nav];
    [self addChildViewController:self.mainVC];
    nav.view.frame = CGRectMake(0, 0, kScreenWidth-100, kScreenHeight);
    self.mainVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    WS(sliderVC)
    self.typeBlock = ^(UIViewController *VC) {
        //[sliderVC createPushNextVCWith:classObject];
        [sliderVC createPushVC:VC];
    };
    
}
- (void)createPushVC:(UIViewController *)VC{
//    Class class = NSClassFromString(classObject);
//    UIViewController *vc = [class new];
    [self closeDrawer];
    CSTabBarController *mainVC = (CSTabBarController *)self.mainVC;
    CSNavigationController *nav = (CSNavigationController *)[mainVC pop_NavController];
    [nav pushViewController:VC animated:YES];
    
    //    POPSIngle *sharePop = [POPSIngle shareSingle];
    //    sharePop.isOpenLeftVC = NO;
}
- (void)createPushNextVCWith:(NSString *)classObject{
    Class class = NSClassFromString(classObject);
    UIViewController *vc = [class new];
    CSTabBarController *mainVC = (CSTabBarController *)self.mainVC;
    CSNavigationController *nav = (CSNavigationController *)[mainVC pop_NavController];
    [nav pushViewController:vc animated:YES];
    [self closeDrawer];
//    POPSIngle *sharePop = [POPSIngle shareSingle];
//    sharePop.isOpenLeftVC = NO;
}

//打开抽屉
- (void)openDrawer{
//    self.mainVC.view.frame = CGRectMake(kScreenWidth-100, 0, kScreenWidth, kScreenHeight);
    [UIView animateWithDuration:0.25 animations:^{
        [self open];
    }];
}
- (void)openDrawerWithAnimation:(BOOL)animation{
    if (animation) {
        [self openDrawer];
    }else{
        [self open];
    }
}
- (void)open{
    self.mainVC.view.x = kScreenWidth-100;
    self.maskView.alpha = 0.5;
}
//关闭抽屉
- (void)closeDrawer{
//    self.mainVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.mainVC.view.x = 0;
    self.maskView.alpha = 0.0;
}

- (UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        _maskView.y = 64;
        _maskView.backgroundColor = [UIColor greenColor];
        _maskView.alpha = 0.0;
        
    }
    return _maskView;
}











- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
