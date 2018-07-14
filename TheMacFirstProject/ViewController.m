//
//  ViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/3/23.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "ViewController.h"
#import "Y_StockChartViewController.h"
#import "AppDelegate.h"
#import "NewViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *topScrollView;
@property (nonatomic,strong)UIScrollView *contentScrollView;
@end

@implementation ViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
//    //1.创建scrollView的滑动选择按钮
//    [self setUpTopScrollView];
//    //2.下面的滑动scrollView现实内容的tableView
//    [self setupContentScrollView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"专业k线" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 200, 100);
    [btn addTarget:self action:@selector(NewBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}
- (void)NewBtnCLick:(UIButton *)sender {
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isEable = YES;
    Y_StockChartViewController *stockChartVC = [Y_StockChartViewController new];
//    stockChartVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:stockChartVC animated:YES completion:nil];
    
//    NewViewController *newVC = [[NewViewController alloc] init];
////    newVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self.navigationController pushViewController:newVC animated:YES];
    
//    SecondViewController *secondVC = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:secondVC animated:YES];
    
//    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
//    [self.navigationController pushViewController:thirdVC animated:YES];
    
}
- (BOOL)shouldAutorotate
{
    return NO;
}






























































- (void)setUpTopScrollView{
    NSArray *array = @[@"新闻",@"视频",@"娱乐",@"体育",@"科技",@"历史",@"时尚"];
    for (int i = 0; i < array.count; i++) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor colorWithRed:(arc4random()%250+i)/255.0 green:(arc4random()%250+i)/255.0 blue:(arc4random()%250+i)/255.0 alpha:1];
        vc.title = array[i];
        [self addChildViewController:vc];
    }
    
    
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40)];
    _topScrollView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    _topScrollView.showsVerticalScrollIndicator = NO;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_topScrollView];
    
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(80*i, 0, 80, 40);
        button.tag = i;
        [button addTarget:self action:@selector(btnCLKick:) forControlEvents:UIControlEventTouchUpInside];
        [_topScrollView addSubview:button];
    }
    
    [_topScrollView setContentSize:CGSizeMake(80*array.count, 0)];
    
}
- (void)btnCLKick:(UIButton *)sender {
    NSLog(@"%@:%ld:%f:%f",sender.currentTitle,sender.tag,self.contentScrollView.contentOffset.x,self.contentScrollView.contentSize.width);
    [self.contentScrollView setContentOffset:CGPointMake(sender.tag*self.view.bounds.size.width, 0) animated:YES];
    
}
- (void)setupContentScrollView{
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 140, self.view.bounds.size.width, self.view.bounds.size.height-140)];
    _contentScrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_contentScrollView];
    
    _contentScrollView.contentOffset = CGPointMake(0, 0);
    _contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count*self.view.bounds.size.width, 0);
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    [self scrollViewDidEndScrollingAnimation:_contentScrollView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSUInteger index = scrollView.contentOffset.x/self.view.bounds.size.width;
    UIViewController *vc = self.childViewControllers[index];
    [scrollView addSubview:vc.view];
//    vc.view.x = scrollView.contentOffset.x;
//    vc.view.y = 0.0;
    vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0.0, self.view.bounds.size.width, self.view.bounds.size.height-140);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
