//
//  ThirdViewController.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/11.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "ThirdViewController.h"
#import "ShowSelectView.h"
#import "FourViewController.h"
#import "ShanBorderView.h"
#import "TopupCustomView.h"


@interface ThirdViewController ()
@property (nonatomic,strong)UIButton *topBtn;
@property (nonatomic,strong)UIButton *btmBtn;
@property (nonatomic,strong)ShowSelectView *selectTopView;
@property (nonatomic,strong)ShowSelectView *selectBtmView;
@property (nonatomic,strong)CustomSelectView *selectView;
@property (nonatomic,strong)ShanBorderView *boarderView;
@property (nonatomic,strong)TopupCustomView *customView;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"自定义的VC";
    self.view.backgroundColor = [UIColor greenColor];
//    NSArray *topArr = @[@"默认",@"买单",@"卖单"];
//    NSArray *btmArr = @[@"默认",@"CNY",@"USD"];
    NSString *version = [[UIDevice currentDevice] systemVersion];
    if ([version floatValue] < 11.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }else{
        
    }
    
    [self createCustomView];
    [self createSubViewsForThird];
    [self createSelectCustomView];
    
    
    
    
}
- (void)createSelectCustomView{
    self.customView = [[TopupCustomView alloc] init];
    [self.view addSubview:self.customView];
    self.customView.name = @"BTC";
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(200));
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
    self.customView.topSelectBlock = ^(UIButton *btn) {
        NSLog(@"1234567890-9876543");
    };
}
//闪动边框
- (void)createCustomView {
    self.boarderView = [[ShanBorderView alloc] init];
    [self.view addSubview:self.boarderView];
    [self.boarderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
    }];
}
//创建按钮
- (void)createSubViewsForThird{
    self.topBtn = [self createCustomBtn];
    [self.topBtn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.topBtn.selected = NO;
    [self.view addSubview:self.topBtn];
    self.btmBtn = [self createCustomBtn];
    [self.btmBtn addTarget:self action:@selector(btmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btmBtn.selected = NO;
    [self.view addSubview:self.btmBtn];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(500);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    [self.btmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(300);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
}
- (UIButton *)createCustomBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"默认" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    
    return btn;
}
- (void)topBtnClick:(UIButton *)sender {
    ShowSelectFrome selectfrom;
    NSArray *array;
        //向上
        NSLog(@"向上");
        selectfrom = FromeBottom;
    
    //开始闪动
    //[self.boarderView.backView.layer addAnimation:[self opacityForever_Animation:0.5] forKey:nil];
//    self.boarderView.backView.alpha = 1.0;
    self.boarderView.backView.layer.borderColor = [UIColor redColor].CGColor;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.boarderView.backView.alpha = 0.0;
        self.boarderView.backView.layer.borderColor = [UIColor redColor].CGColor;
    } completion:^(BOOL finished) {
        self.boarderView.backView.alpha = 1.0;
        [UIView animateWithDuration:0.5 animations:^{
            self.boarderView.backView.alpha = 0.0;
            self.boarderView.backView.layer.borderColor = [UIColor redColor].CGColor;
        } completion:^(BOOL finished) {
            self.boarderView.backView.alpha = 1.0;
            [UIView animateWithDuration:0.5 animations:^{
                self.boarderView.backView.alpha = 0.1;
                self.boarderView.backView.layer.borderColor = [UIColor redColor].CGColor;
            } completion:^(BOOL finished) {
                self.boarderView.backView.alpha = 1.0;
                [UIView animateWithDuration:0.5 animations:^{
                    self.boarderView.backView.alpha = 0.1;
                    self.boarderView.backView.layer.borderColor = [UIColor redColor].CGColor;
                } completion:^(BOOL finished) {
                    self.boarderView.backView.alpha = 1.0;
                    
                }];
            }];
        }];
    }];
    
    
    
    
//    FourViewController *fourVC = [[FourViewController alloc] init];
//    [self.navigationController pushViewController:fourVC animated:YES];
    
    
    
    
    
//        array = @[@"默认",@"买单",@"卖单"];
        /*sender.selected = !sender.selected;
    
        if (sender.selected) {
            self.selectTopView = [[ShowSelectView alloc] initWithArray:array andCurrentTitle:sender.currentTitle];
            [self.view addSubview:self.selectTopView];
            [self.selectTopView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.right.equalTo(sender);
                make.bottom.equalTo(sender.mas_top);
                make.height.mas_equalTo(50*array.count);
            }];
            WS(weakSelf)
            self.selectTopView.showSelectBlock = ^(NSString *title) {
                [sender setTitle:title forState:UIControlStateNormal];
                sender.selected = NO;
                [weakSelf.selectTopView removeFromSuperview];
                weakSelf.selectTopView = nil;
            };
        }else{
            [self.selectTopView removeFromSuperview];
            self.selectTopView = nil;
        }*/
}
//闪烁动画
-(CABasicAnimation *)opacityForever_Animation:(float)time
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = 15;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
    return animation;
}
- (void)btmBtnClick:(UIButton *)sender {
//    ShowSelectFrome selectfrom = FromeTop;
    NSArray *array = @[@"默认",@"CNY",@"USD"];
    sender.selected = !sender.selected;
    ShowSelectFrome selectFrom = FromeTop;
    if (sender.selected) {
        self.selectView = [[CustomSelectView alloc] initWithArray:array];
        self.selectView.selectFrom = selectFrom;
        self.selectView.currentTitle = sender.currentTitle;
        [self.view addSubview:self.selectView];
        [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(sender);
            make.height.mas_equalTo(40*array.count);
            if (selectFrom == FromeTop) {
                make.top.equalTo(sender.mas_bottom);
            }else{
                make.bottom.equalTo(sender.mas_top);
            }
        }];
        WS(weakSelf)
        self.selectView.customSelectBlock = ^(NSString *title) {
            [sender setTitle:title forState:UIControlStateNormal];
            sender.selected = NO;
            [weakSelf.selectView removeFromSuperview];
            weakSelf.selectView = nil;
        };
    }else{
        [self.selectView removeFromSuperview];
        self.selectView = nil;
    }
    
   /* if (sender.selected) {
        
        self.selectBtmView = [[ShowSelectView alloc] initWithArray:array andCurrentTitle:sender.currentTitle];
        [self.view addSubview:self.selectBtmView];
        [self.selectBtmView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(sender);
            make.top.equalTo(sender.mas_bottom);
            make.height.mas_equalTo(50*array.count);
        }];
        WS(weakSelf)
        self.selectBtmView.showSelectBlock = ^(NSString *title) {
            [sender setTitle:title forState:UIControlStateNormal];
            sender.selected = NO;
            [weakSelf.selectBtmView removeFromSuperview];
            weakSelf.selectBtmView = nil;
        };
    }else{
        [self.selectBtmView removeFromSuperview];
        self.selectBtmView = nil;
    }*/
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
