//
//  UIView+Extension.m
//  NewsBoardDemo
//
//  Created by student on 16/4/19.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

//重写height的set和get方法
- (void)setHeight:(CGFloat)height
{
//  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height
{
    return self.frame.size.height;
}

//重写width的set和get方法
- (void)setWidth:(CGFloat)width
{
//  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

//重写x坐标的set和get方法
- (void)setX:(CGFloat)x
{
//    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

//重写用坐标的set和get方法
- (void)setY:(CGFloat)y
{
//    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

/**
 * setCornerRadius   给view设置圆角
 * @param value      圆角大小
 * @param rectCorner 圆角位置
 **/
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner{
    
    [self layoutIfNeeded];//这句代码很重要，不能忘了
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

@end
