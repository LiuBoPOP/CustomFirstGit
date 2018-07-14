//
//  ShowSelectView.h
//  TheMacFirstProject
//
//  Created by 刘波 on 2018/6/11.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ShowSelectFrome) {
    FromeTop  = 0,
    FromeBottom
};
@interface ShowSelectView : UIView
- (instancetype)initWithArray:(NSArray *)array andCurrentTitle:(NSString *)title;
@property (nonatomic,copy)void(^showSelectBlock)(NSString *title);
@end

@interface CustomSelectView : UIView
@property (nonatomic,assign)ShowSelectFrome  selectFrom;
@property (nonatomic,copy)NSString *currentTitle;
@property (nonatomic,copy)void(^customSelectBlock)(NSString *title);
- (instancetype)initWithArray:(NSArray *)array;
@end
