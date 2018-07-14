//
//  CustomTextFieldCountDown.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/21.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "CustomTextFieldCountDown.h"
@interface CustomTextFieldCountDown (){
//    int count;
}
@property (nonatomic,strong)UIButton *downBtn;
@property (nonatomic,strong)NSTimer *timer;
@end
static NSString *title = @"获取验证码";
static int  count = 60;
@implementation CustomTextFieldCountDown
- (instancetype)init
{
    self = [super init];
    if (self) {
//        count = 60;
        [self createCountDownSubviews];
    }
    return self;
}

- (void)createCountDownSubviews{
    [self addSubview:self.downBtn];
    [self.downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self).with.offset(-space);
        make.width.mas_equalTo(100);
    }];
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-105);
    }];
}
- (UIButton *)downBtn{
    if (!_downBtn) {
        _downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downBtn  setTitle:title forState:UIControlStateNormal];
        _downBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_downBtn setBackgroundColor:[UIColor blueColor]];
        [_downBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentRight)];
        [_downBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_downBtn addTarget:self action:@selector(downBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downBtn;
}
- (void)downBtnClick:(UIButton *)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(customtimerDown:) userInfo:nil repeats:YES];
    [self.timer fire];
    
}
- (void)customtimerDown:(NSTimer *)timer {
    count--;
    self.downBtn.userInteractionEnabled = NO;
    [self.downBtn setTitle:[NSString stringWithFormat:@"%d s",count] forState:UIControlStateNormal];
    if (self.tfCountDownBlock) {//返回出去做网络请求
        self.tfCountDownBlock(self.textField.text);
    }
    if (count < 0) {
        [self invedateTimer];
    }
}
- (void)invedateTimer{
    [self.timer invalidate];
    self.timer = nil;
    count = 60;
    self.downBtn.userInteractionEnabled = YES;
    [self.downBtn setTitle:title forState:UIControlStateNormal];
}
/*874638550
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
