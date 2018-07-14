//
//  POPCustomSelectView.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/8.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "POPCustomSelectView.h"
@interface POPCustomSelectView ()
@property (nonatomic,strong)UIButton *pubBtn;
@property (nonatomic,strong)UILabel     *label;
@property (nonatomic,strong)UIScrollView *topScroll;
@property (nonatomic,copy)NSArray *dataArr;
@end
static const float width = 65;
static const float height = 50;
@implementation POPCustomSelectView
- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.dataArr = [NSArray arrayWithArray:array];
        if (array.count <= 6) {
            [self createCustomBtnWith:array andSuperView:self];
            [self createLabelForBtnWithSuperView:self];
        }else{
            [self layoutIfNeeded];
            
            [self addSubview:self.topScroll];
            [self.topScroll mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.left.and.right.and.bottom.equalTo(self);
            }];
            self.topScroll.contentSize = CGSizeMake(array.count*width, 0);
            [self createScrollCustomBtnWith:array andSuperViews:self.topScroll];
            [self createLabelForBtnWithSuperView:self.topScroll];
        }
        
    }
    return self;
}
//- (void)
- (void)createScrollCustomBtnWith:(NSArray *)array andSuperViews:(UIView *)view{
    UIButton *preView;
    for (int i = 0; i < array.count; i++) {
        UIButton *titleBtn = [self createBtnWithTitle:array[i]];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * width, 0, width, height-1);
        [view addSubview:titleBtn];
        preView = titleBtn;
        if (i == 0) {
            titleBtn.selected = YES;
            self.pubBtn = titleBtn;
        }
    }
}
- (UIScrollView *)topScroll{
    if (!_topScroll) {
        _topScroll = [[UIScrollView alloc] init];
        _topScroll.showsVerticalScrollIndicator = NO;
        _topScroll.showsHorizontalScrollIndicator = NO;
        _topScroll.contentOffset = CGPointMake(0, 0);
        _topScroll.backgroundColor = [UIColor blackColor];
    }
    return _topScroll;
}
//创建btn
- (void)createCustomBtnWith:(NSArray *)array andSuperView:(UIView *)view{
    UIButton *preView;
    for (int i = 0; i < array.count; i++) {
        UIButton *titleBtn = [self createBtnWithTitle:array[i]];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * (kScreenWidth/array.count), 0, kScreenWidth/array.count, height-1);
        [view addSubview:titleBtn];
        preView = titleBtn;
        if (i == 0) {
            titleBtn.selected = YES;
            self.pubBtn = titleBtn;
        }
    }
}
- (UIButton *)createBtnWithTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.selected = NO;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)btnClick:(UIButton *)sender {
    
    if (self.pubBtn.tag != sender.tag) {
        sender.selected  = YES;
        self.pubBtn.selected = NO;
        self.pubBtn = sender;
        self.label.frame = CGRectMake(self.pubBtn.frame.origin.x+5, self.pubBtn.frame.size.height, self.pubBtn.frame.size.width-10, 1);
        if (self.popSelectBlock) {
            self.popSelectBlock(sender);
        }
    }
}
//创建跟随的label
- (void)createLabelForBtnWithSuperView:(UIView *)view{
    self.label.frame = CGRectMake(self.pubBtn.frame.origin.x+5, self.pubBtn.bounds.size.height, self.pubBtn.frame.size.width-10, 1);
    [view addSubview:self.label];
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}
- (void)setSelectBtnColor:(UIColor *)selectBtnColor{
    _selectBtnColor = selectBtnColor;
    NSArray *btnArr;
    if (self.dataArr.count <= 6) {
        btnArr = self.subviews;
    }else{
        btnArr = self.topScroll.subviews;
    }
    for (UIView *view in btnArr) {
        if ([view isKindOfClass:NSClassFromString(@"UIButton")]) {
            UIButton *btnView = (UIButton *)view;
            [btnView setTitleColor:selectBtnColor forState:UIControlStateSelected];
            [btnView setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        }
    }
    self.label.backgroundColor = selectBtnColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
