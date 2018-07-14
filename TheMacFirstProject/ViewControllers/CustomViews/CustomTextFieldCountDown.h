//
//  CustomTextFieldCountDown.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/21.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "CustomTextField.h"

@interface CustomTextFieldCountDown : CustomTextField
- (void)invedateTimer;
@property (nonatomic,copy)void(^tfCountDownBlock)(NSString *text);
@end
