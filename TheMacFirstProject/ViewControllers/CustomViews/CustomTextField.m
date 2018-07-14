//
//  CustomTextField.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/21.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "CustomTextField.h"
@interface CustomTextField ()
@property (nonatomic,strong)UIImageView *leftImage;

@end

@implementation CustomTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self layoutIfNeeded];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor redColor].CGColor;
        [self createCustomSubviews];
    }
    return self;
}
- (void)createCustomSubviews{
    [self addSubview:self.leftImage];
    [self addSubview:self.textField];
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(space);
        make.width.and.height.mas_equalTo(30);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImage.mas_right).with.offset(space);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self).with.offset(-space);
        make.height.mas_equalTo(30);
    }];
}


- (void)setSecurity:(BOOL)security{
    _security = security;
    self.textField.secureTextEntry = security;
}
- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = placeHolder;
    self.textField.placeholder = placeHolder;
}



- (UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] init];
        _leftImage.backgroundColor = [UIColor orangeColor];
    }
    return _leftImage;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:13];
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
