//
//  UITextField+CountDown.m
//  Alicms
//
//  Created by 刘波 on 2018/4/9.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "UITextField+CountDown.h"
#import <objc/runtime.h>
@interface UITextField ()
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIButton *btn;
@end
static const void *UtilityKey = &UtilityKey;
static const void *timerKey = &timerKey;
static const void *btnKey = &btnKey;
static NSString *verfiTitle = @"获取验证码";
static int count;
@implementation UITextField (CountDown)
- (instancetype)initWithMobil:(BOOL)isMobil{
    self = [super init];
    if (self) {
        self.rightView = [self createRightBtn];
        self.rightViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
- (UIButton *)createRightBtn{
    [self.timer invalidate];
    self.timer = nil;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 10086;
    [btn setTitle:NSLocalizedString(verfiTitle, nil) forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.frame = CGRectMake(0, 0, 100, 25);
    [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    self.btn = btn;
    return btn;
}
- (void)rightBtnClick:(UIButton *)sender {
    
    if (self.eventHandler) {
      self.eventHandler();
        
            [self invaliteDownTimer];
            //    [self.btn removeFromSuperview];
            //    self.btn = nil;
            sender.enabled = NO;
            self.btn = sender;
            self.timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownSexty:) userInfo:sender repeats:YES];
        
    }
    
}
- (void)countDownSexty:(NSTimer *)timer{
    count ++;
    UIButton *btn = timer.userInfo;
    // btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setTitle:[NSString stringWithFormat:@"%d秒",60 - count] forState:UIControlStateNormal];
    if (count >= 60) {
        [self invaliteDownTimer];
        btn.enabled = YES;
       [btn setTitle:verfiTitle forState:UIControlStateNormal];
    }
}
- (void)invaliteDownTimer{
//    UIButton *btn = [self viewWithTag:10086];
//    self.btn.enabled = YES;
//    [self.btn setTitle:verfiTitle forState:UIControlStateNormal];
    count = 0;
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)setTimer:(NSTimer *)timer{
    objc_setAssociatedObject(self, timerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimer *)timer{
    return objc_getAssociatedObject(self, timerKey);
}
- (void)setBtn:(UIButton *)btn{
    objc_setAssociatedObject(self, btnKey, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIButton *)btn{
    return objc_getAssociatedObject(self, btnKey);
}
- (void)setEventHandler:(textFieldHandler)eventHandler{
    objc_setAssociatedObject(self, UtilityKey, eventHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (textFieldHandler)eventHandler{
    return objc_getAssociatedObject(self, UtilityKey);
}

@end
