//
//  FourViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/12.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "FourViewController.h"
#import "FiveViewController.h"
#import "TopupCustomView.h"
#import "UICustomTextField.h"

@interface FourViewController ()
@property (nonatomic,strong)TopupCustomView *customView;
@property (nonatomic,strong)UICustomTextField *customTF;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self createNavSearchBar];//创建导航上的搜索按钮
    //创建单选的下拉选择View
    [self createSelectOneDropDownView];
    //创建输入框TF
    [self createCustomTFView];
    
}
//创建输入框TF
- (void)createCustomTFView{
    self.customTF = [[UICustomTextField alloc] init];
    [self.view addSubview:self.customTF];
//    self.customTF.leftName = @"今天好天气";
    self.customTF.leftImgName = @"psw.png";
    self.customTF.leftName = @"今天好天气";
    [self.customTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.left.and.right.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
}
//创建单选的下拉选择View
- (void)createSelectOneDropDownView{
    self.customView = [[TopupCustomView alloc] init];
    [self.view addSubview:self.customView];
    self.customView.name = @"BTC";
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(kScreenWidth);
        make.height.mas_equalTo(50);
    }];
    self.customView.topSelectBlock = ^(UIButton *btn) {
        NSLog(@"1234567890-9876543");
    };
}


//创建导航上的搜索按钮
- (void)createNavSearchBar{
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setTitle:@"🔍" forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"🔍"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
}
- (void)searchBtnClick:(UIBarButtonItem *)item {
    FiveViewController *fiveVC = [[FiveViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:fiveVC];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)createNavTitleView{
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor greenColor];
    backView.frame = CGRectMake(0, 0, 160, 44);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.frame = CGRectMake(5, 0, 44, 44 );
    imageView.image = [UIImage imageNamed:@""];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(55, 0, 100, 44);
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"1234" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [backView addSubview:imageView];
    [backView addSubview:btn];
    
    self.navigationItem.titleView = backView;
    
    
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
