//
//  POPCustomSelectView.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/8.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POPCustomSelectView : UIView
- (instancetype)initWithArray:(NSArray *)array;
@property (nonatomic,strong)UIColor  *selectBtnColor;
@property (nonatomic,copy)void(^popSelectBlock)(UIButton *btn);
@end
