//
//  UITextField+CountDown.h
//  Alicms
//
//  Created by 刘波 on 2018/4/9.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^textFieldHandler)(void);
@interface UITextField (CountDown)
- (instancetype)initWithMobil:(BOOL)isMobil;
@property (nonatomic,copy)textFieldHandler eventHandler;
- (void)invaliteDownTimer;
@end
