//
//  UIView+Extension.h
//  NewsBoardDemo
//
//  Created by student on 16/4/19.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/*
 *设置高度
 */
@property (nonatomic,assign)CGFloat height;

/*
 *设置宽度
 */
@property (nonatomic,assign)CGFloat width;

/*
 *设置x坐标
 */
@property (nonatomic,assign)CGFloat x;

/*
 *设置y坐标
 */
@property (nonatomic,assign)CGFloat y;
//设置圆角
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner;
@end
