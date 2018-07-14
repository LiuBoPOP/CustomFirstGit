//
//  ShanBorderView.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/14.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "ShanBorderView.h"
@interface ShanBorderView ()

@end

@implementation ShanBorderView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    [self addSubview:self.backView];
    [self addSubview:self.textField];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.and.right.equalTo(self);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).with.offset(2);
        make.bottom.and.right.equalTo(self).with.offset(-2);
    }];
    
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor orangeColor];
//        _backView.layer.cornerRadius = 2;
        _backView.layer.borderWidth = 2;
        _backView.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _backView;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
    }
    return _textField;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
