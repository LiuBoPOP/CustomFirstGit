//
//  CustomTextField.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/21.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>
static CGFloat space = 5;
@interface CustomTextField : UIView
@property (nonatomic,strong)UITextField    *textField;
@property (nonatomic,assign)BOOL security;//输入框是否加密
@property (nonatomic,copy)NSString *placeHolder;//输入框的placehodle
@end
