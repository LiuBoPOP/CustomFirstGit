//
//  ShowSelectView.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/11.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "ShowSelectView.h"
@interface ShowSelectView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)UITableView *selectTableView;
@property (nonatomic,copy)NSString *currentTitle;
@end
static NSString *cellIdentifier = @"selectViewCellIdentifier";
@implementation ShowSelectView
- (instancetype)initWithArray:(NSArray *)array andCurrentTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.dataArr = [NSMutableArray arrayWithArray:array];
        self.currentTitle = title;
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    self.selectTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.selectTableView.delegate = self;
    self.selectTableView.dataSource = self;
    self.selectTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.selectTableView];
    [self.selectTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.selectTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.dataArr[indexPath.row];
    if ([cell.textLabel.text isEqualToString:self.currentTitle]) {
        cell.textLabel.textColor = [UIColor redColor];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.dataArr[indexPath.row];
//    if (![self.currentTitle isEqualToString:title]) {
        if (self.showSelectBlock) {
            self.showSelectBlock(title);
        }
//    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end

@interface CustomSelectView ()
@property (nonatomic,strong)NSMutableArray *subBtnsArr;
@end

@implementation CustomSelectView
- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self createCustomSubViewsWith:array];
    }
    return self;
}
- (void)createCustomSubViewsWith:(NSArray *)array{
    for (int i = 0; i < array.count; i++) {
        NSString *title = array[i];
        UIButton *btn = [self createCustomBtnWith:title];
        [self addSubview:btn];
    }
}
- (UIButton *)createCustomBtnWith:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(customBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}
- (void)customBtnClick:(UIButton *)sender {
    if (self.customSelectBlock) {
        self.customSelectBlock(sender.currentTitle);
    }
}
- (void)setSelectFrom:(ShowSelectFrome)selectFrom{
    _selectFrom = selectFrom;
    if (selectFrom == FromeTop) {
        UIButton *pubbtn;
        for (UIButton *btn in self.subviews) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.right.equalTo(self);
                make.height.mas_equalTo(40);
                if (pubbtn) {
                    make.top.equalTo(pubbtn.mas_bottom);
                }else{
                    make.top.equalTo(self);
                }
            }];
            
            pubbtn = btn;
            
        }
    }else{
        UIButton *pubbtn;
        for (UIButton *btn in self.subviews) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.right.equalTo(self);
                make.height.mas_equalTo(40);
                if (pubbtn) {
                    make.bottom.equalTo(pubbtn.mas_top);
                }else{
                    make.bottom.equalTo(self);
                }
            }];
            
            pubbtn = btn;
            
        }
    }
}
- (void)setCurrentTitle:(NSString *)currentTitle{
    _currentTitle = currentTitle;
    for (UIButton *btn in self.subviews) {
        NSString *title = btn.currentTitle;
        if ([title isEqualToString:currentTitle] && ![title isEqualToString:@""] && title != nil) {
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }
}
@end






