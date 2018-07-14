//
//  TopupCustomView.h
//  Alicms
//
//  Created by 刘波 on 2018/4/20.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class 
@interface TopupCustomView : UIView
@property (nonatomic,copy)void(^topSelectBlock)(UIButton *btn);
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *imgs;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@interface TopupTableViewCell : UITableViewCell


@end
