//
//  UIBarButtonItem+Extension.h
//  NewsBoardDemo
//
//  Created by student on 16/4/19.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (id)itemWithTitle:(NSString *)title withImageName:(NSString *)imageName addTarget:(id)target action:(SEL)selector;
+ (id)rightItemWithTitle:(NSString *)title withImageName:(NSString *)rightImageName addTarget:(id)target action:(SEL)selector;
@end
