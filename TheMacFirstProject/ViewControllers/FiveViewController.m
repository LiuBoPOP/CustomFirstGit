//
//  FiveViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/12.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()<UISearchBarDelegate>
@property (nonatomic,strong)UISearchBar *searchBar;
@end

@implementation FiveViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.searchBar becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self createCustomSearchBar];
    
    
}
//2.创建热搜词 以及历史搜索记录




//1.创建搜索输入框
- (void)createCustomSearchBar{
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"请输入关键字";
    self.searchBar.showsCancelButton = YES;
    self.searchBar.returnKeyType = UIReturnKeySearch;
    self.searchBar.delegate = self;
    self.searchBar.barStyle = UIBarStyleDefault;
    self.navigationItem.titleView = self.searchBar;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"开始搜索了");
    //做网络请求获取新数据 展示
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
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
