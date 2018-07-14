//
//  UICustomTextField.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/20.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomTextField : UIView
@property (nonatomic,copy)NSString *leftName;//左侧label的名字
@property (nonatomic,copy)NSString *leftImgName;//左侧imageView的名字
@property (nonatomic,copy)NSString *rigthName;//右侧label的名字
@property (nonatomic,strong)NSString *rightImgName;//右侧imageView的名字
@end
