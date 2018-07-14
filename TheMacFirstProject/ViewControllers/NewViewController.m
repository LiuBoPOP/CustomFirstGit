//
//  NewViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/3/30.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "NewViewController.h"
#import "Masonry.h"
#import "CustomTextFieldCountDown.h"

@interface NewViewController ()
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)CustomTextFieldCountDown *tfDown;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", NSHomeDirectory());
//    self.title = @"新闻的VC";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.webView];
//    [self loadString:@"K线图"];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    for (int i = 0; i < 3; i++) {
        [self createDownViewWith:i];
    }
    
    
    
}

- (void)createDownViewWith:(int)i{
   CustomTextFieldCountDown *downTF = [[CustomTextFieldCountDown alloc] init];
    [self.view addSubview:downTF];
    [downTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(100+50*i);
        make.height.mas_equalTo(40);
    }];
}
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor orangeColor];
        _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    }
    return _webView;
}
// 让浏览器加载指定的字符串,使用m.baidu.com进行搜索
- (void)loadString:(NSString *)str  {
    // 1. URL 定位资源,需要资源的地址
    NSString *urlStr = str;
//    if (![str hasPrefix:@"http://"]) {
        urlStr = [NSString stringWithFormat:@"http://btc.alicms.com/index/trade/kline/btc_usdt?money=usd"];
//    }
    urlStr = @"http://www.baidu.com";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    // 2. 把URL告诉给服务器,请求,从m.baidu.com请求数据
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3. 发送请求给服务器
    [self.webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self closeBtnAction];
//}
/**webView退出方法*/
- (void)closeBtnAction{
    self.webView = nil;
    [self cleanCacheAndCookie];
    [self.navigationController popViewControllerAnimated:YES];
}
/**清除缓存和cookie*/
- (void)cleanCacheAndCookie{
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
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
