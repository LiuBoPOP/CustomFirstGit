//
//  UIBarButtonItem+Extension.m
//  NewsBoardDemo
//
//  Created by student on 16/4/19.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (id)itemWithTitle:(NSString *)title withImageName:(NSString *)imageName addTarget:(id)target action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 上 左 下 右
    // [button setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
//    button.width = 60;
//    button.height = 30;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    button.height = 50;
    button.width = button.currentTitle.stringWidth + button.currentImage.size.width;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}
+ (id)rightItemWithTitle:(NSString *)title withImageName:(NSString *)rightImageName addTarget:(id)target action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 上 左 下 右
    // [button setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    //    button.width = 60;
    //    button.height = 30;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    button.height = 50;
    button.width = button.currentTitle.stringWidth + button.currentImage.size.width;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
