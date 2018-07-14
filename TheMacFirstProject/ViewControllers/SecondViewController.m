//
//  SecondViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/4/23.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "SecondViewController.h"
#import "MJRefresh.h"
#import "POPCustomSelectView.h"



#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SecondViewController ()<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"阅读的 VC";
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    webView.delegate = self;
//    [self.view addSubview:webView];
//
//
////    NSString *url = @"http://btc.alicms.com/index/Ceshi/index?order=qwertyuio&market=ltc_btn";
////    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"trade"];
//    NSString *urlString = [path stringByAppendingString:[NSString stringWithFormat:@"?market=ltc_btc&uid=180&touken=askdhkasdhk.dak,jhkjaslkas&ips=192.168.10.127"]];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    NSString *version = [[UIDevice currentDevice] systemVersion];
    if ([version floatValue] < 11.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }else{
        
    }
    
    NSArray *array = @[@"新闻",@"娱乐",@"视频",@"军事",@"体育",@"财经",@"123",@"234",@"345"];
    POPCustomSelectView *selectView = [[POPCustomSelectView alloc] initWithArray:array];
//    selectView.selectBtnColor = [UIColor colorWithRed:36/255.0 green:39/255.0 blue:49/255.0 alpha:1];
    selectView.selectBtnColor = [UIColor brownColor];
    [self.view addSubview:selectView];
    [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    [self createDataArrForUI];
    [self createTableView];
    
    
}
- (void)createDataArrForUI{
    for (int i = 0; i < 100; i ++) {
        NSString *name = [NSString stringWithFormat:@"这是一个tableView 的自定义 展位图的demo：%d",i];
        [self.dataArr addObject:name];
    }
}
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0+50, kScreenWidth, kScreenHeight-64-50-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"123"];
    self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArr removeAllObjects];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


#pragma mark - 调节占位图
- (UIImage *)rl_noDataViewImage {
    return [UIImage imageNamed:@"orderimage@2x.png"];
}

- (NSString *)rl_noDataViewString {
    return @"亲，您还没有委托的订单数据";
}

- (UIColor *)rl_noDataViewStringColor {
    return [UIColor colorWithRed:160/255.0 green:170/255.0 blue:190/255.0 alpha:1];
//    return [UIColor redColor];
}



























- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}




- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
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
