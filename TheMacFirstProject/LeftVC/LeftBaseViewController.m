//
//  LeftBaseViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/7/10.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "LeftBaseViewController.h"
#import "AppDelegate.h"

@interface LeftBaseViewController ()
@property (nonatomic,strong)UIButton *backBtn;//返回按钮
@end

@implementation LeftBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self createCustomBackBtn];
}
- (void)createCustomBackBtn{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
}
- (void)backBtnClick:(UIBarButtonItem *)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.popSliderVC openDrawerWithAnimation:NO];
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitle:@"<返回" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
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
