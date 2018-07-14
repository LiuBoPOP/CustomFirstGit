//
//  UICustomTextField.m
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/20.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "UICustomTextField.h"
@interface UICustomTextField ()
@property (nonatomic,strong)UITextField *tf;//中间的输入框
@property (nonatomic,strong)UILabel  *leftnameLabel;//左侧的nameLabel
@property (nonatomic,strong)UIImageView *leftImage;//左侧的imageVIew
@property (nonatomic,strong)UILabel  *rightnameLabel;//右侧的nameLabel
@property (nonatomic,strong)UIImageView *rightimg;//右侧的imageView

@end

@implementation UICustomTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self createSubViewsTF];
    }
    return self;
}
- (void)createSubViewsTF{
    [self addSubview:self.leftnameLabel];
    [self addSubview:self.leftImage];
    [self addSubview:self.tf];
    [self addSubview:self.rightnameLabel];
    [self addSubview:self.rightimg];
    
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(10);
        make.width.and.height.mas_equalTo(30);
    }];
    
    [self.leftnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
//        make.left.equalTo(self.leftImage.mas_right).with.offset(5);
        make.left.equalTo(self).with.offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [self.rightnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_equalTo(20);
    }];
    [self.rightimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self).with.offset(-10);
        make.width.and.height.mas_equalTo(30);
    }];
    
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_equalTo(30);
        make.left.equalTo(self).with.offset(10);
        make.left.equalTo(self.leftnameLabel.mas_right).with.offset(5).priority(500);
        make.left.equalTo(self.leftImage.mas_right).with.offset(5).priority(350);
        
        make.right.equalTo(self.rightnameLabel.mas_left).with.offset(-5);
        make.right.equalTo(self.rightimg.mas_left).with.offset(-5).priority(350);
        make.right.equalTo(self).with.offset(-10).priority(300);
        
    }];
    
}

- (void)setLeftName:(NSString *)leftName{
    _leftName = leftName;
    self.leftnameLabel.hidden = NO;
    self.leftnameLabel.text = leftName;
    if (![self.leftImgName isEqualToString:@""] && self.leftImgName != nil) {
        [self.leftnameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(45);
        }];
    }
    [self.tf mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_equalTo(30);
        make.left.equalTo(self.leftnameLabel.mas_right).with.offset(5);
        make.left.equalTo(self.leftImage.mas_right).with.offset(5).priority(350);
        make.left.equalTo(self).with.offset(10).priority(300);
        make.right.equalTo(self.rightnameLabel.mas_left).with.offset(-5);
        make.right.equalTo(self.rightimg.mas_left).with.offset(-5).priority(350);
        make.right.equalTo(self).with.offset(-10).priority(300);
    }];
}
- (void)setLeftImgName:(NSString *)leftImgName{
    _leftImgName = leftImgName;
    self.leftImage.hidden = NO;
    self.leftImage.image = [UIImage imageNamed:leftImgName];
    if (![self.leftName isEqualToString:@""] && self.leftName != nil) {
        [self.leftnameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(45);
        }];
    }
    
    [self.tf mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_equalTo(30);
        if (![self.leftName isEqualToString:@""] && self.leftName != nil){
            make.left.equalTo(self.leftnameLabel.mas_right).with.offset(5);
            make.left.equalTo(self.leftImage.mas_right).with.offset(5).priority(350);
            make.left.equalTo(self).with.offset(10).priority(300);
        }else{
            make.left.equalTo(self.leftImage.mas_right).with.offset(5);
            make.left.equalTo(self.leftnameLabel.mas_right).with.offset(5).priority(350);
            make.left.equalTo(self).with.offset(10).priority(300);
        }
        make.right.equalTo(self.rightnameLabel.mas_left).with.offset(-5);
        make.right.equalTo(self.rightimg.mas_left).with.offset(-5).priority(350);
        make.right.equalTo(self).with.offset(-10).priority(300);
    }];
    
}



- (UILabel *)leftnameLabel{
    if (!_leftnameLabel) {
        _leftnameLabel = [self createCustomLabel];
    }
    return _leftnameLabel;
}
- (UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [self createCustomImageView];
    }
    return _leftImage;
}
- (UILabel *)rightnameLabel{
    if (!_rightnameLabel) {
        _rightnameLabel = [self createCustomLabel];
    }
    return _rightnameLabel;
}
- (UIImageView *)rightimg{
    if (!_rightimg) {
        _rightimg = [self createCustomImageView];
    }
    return _rightimg;
}
- (UITextField *)tf{
    if (!_tf) {
        _tf = [[UITextField alloc] init];
        _tf.font = [UIFont systemFontOfSize:15];
        _tf.backgroundColor = [UIColor whiteColor];
    }
    return _tf;
}
- (UILabel *)createCustomLabel{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.hidden = YES;
    return label;
}
- (UIImageView *)createCustomImageView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.hidden = YES;
    return imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
