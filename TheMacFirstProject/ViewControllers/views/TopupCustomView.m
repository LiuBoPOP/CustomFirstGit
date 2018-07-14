//
//  TopupCustomView.m
//  Alicms
//
//  Created by 刘波 on 2018/4/20.
//  Copyright © 2018年 刘波. All rights reserved.
//

#import "TopupCustomView.h"
#import "UIImageView+WebCache.h"

@interface TopupCustomView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIImageView *headerImg;
@property (nonatomic,strong)UILabel           *nameLabel;
@property (nonatomic,strong)UIButton        *arrowBtn;
@property (nonatomic,strong)UITableView  *tableView;

@end

@interface TopupTableViewCell ()
@property (nonatomic,strong)UIImageView *headerImg;
@property (nonatomic,strong)UILabel            *nameLabel;
@property (nonatomic,strong)UIImageView  *arrowImage;
@end

static NSString *identifierCell = @"identifierCell";
@implementation TopupCustomView
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.backgroundColor = LXColor(49, 52, 61, 1);
        self.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
        [self createTopupCustomViewSubviews];
    }
    return self;
}
- (void)tapClick:(UITapGestureRecognizer *)tap{
    self.arrowBtn.selected = !self.arrowBtn.selected;
    
    if (self.arrowBtn.selected) {
        //创建tableView展示需要显示的内容和图标
        [self createTableView];
    }else{
        [self removeBackView];
    }
    if (self.topSelectBlock) {
        self.topSelectBlock(self.arrowBtn);
    }
}
- (void)createTopupCustomViewSubviews{
    [self addSubview:self.headerImg];
    [self addSubview:self.nameLabel];
    [self addSubview:self.arrowBtn];
    [self.headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.width.and.height.mas_equalTo(20);
    }];
    [self.headerImg layoutIfNeeded];
    self.headerImg.layer.cornerRadius = 10;
    self.headerImg.layer.masksToBounds = YES;
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(self.headerImg);
        make.width.mas_lessThanOrEqualTo(100);
        make.left.equalTo(self.headerImg.mas_right).with.offset(5);
    }];
    [self.arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self).with.offset(-10);
        make.width.mas_equalTo(13);
        make.height.mas_equalTo(6);
    }];
}
- (void)setName:(NSString *)name{
    _name = name;
    self.nameLabel.text = name.uppercaseString;
}
- (void)setImgs:(NSString *)imgs{
    _imgs = imgs;
    NSString *url = [NSString stringWithFormat:@"%@%@",@"",imgs];
    [self.headerImg sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"Logo.jpg"]];
}
- (UIImageView *)headerImg{
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc] init];
        _headerImg.backgroundColor = [UIColor orangeColor];
    }
    return _headerImg;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
//        _nameLabel.backgroundColor = [UIColor blueColor];
        _nameLabel.textColor = LXColor(161, 173, 194, 1);
    }
    return _nameLabel;
}
- (UIButton *)arrowBtn{
    if (!_arrowBtn) {
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _arrowBtn.selected = NO;
        UIImage *image = [UIImage imageNamed:@"btm23x12px@2x.png"];
        [_arrowBtn setBackgroundImage:image forState:UIControlStateNormal];
        [_arrowBtn addTarget:self action:@selector(arrowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _arrowBtn;
}
- (void)arrowBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (self.arrowBtn.selected) {
        //创建tableView展示需要显示的内容和图标
        [self createTableView];
    }else{
        [self removeBackView];
    }
    
    if (self.topSelectBlock) {
        self.topSelectBlock(sender);
    }
}
- (void)removeBackView{
   
    [self.tableView removeFromSuperview];
    self.tableView = nil;
}
- (void)createTableView{
    
    self.tableView  = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.superview addSubview:self.tableView];
    [self.tableView registerClass:[TopupTableViewCell class] forCellReuseIdentifier:identifierCell];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
        make.left.and.right.equalTo(self);
        make.height.mas_equalTo(200);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;//self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell forIndexPath:indexPath];
    cell.headerImg.image = [UIImage imageNamed:@""];
    cell.nameLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",(long)indexPath.row];
    if (indexPath.row%2 == 0) {
        cell.arrowImage.backgroundColor = [UIColor redColor];
    }else{
        cell.arrowImage.backgroundColor = [UIColor brownColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.arrowBtn.selected = !self.arrowBtn.selected;
//    id model = self.dataArr[indexPath.row];
    TopupTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.nameLabel.text = cell.nameLabel.text;
    [self removeBackView];
}

- (void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr = dataArr;
    //刷新表
    [self.tableView reloadData];
}
@end




@implementation TopupTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCellSubviews];
    }
    return self;
}
- (void)createCellSubviews{
    [self.contentView addSubview:self.headerImg];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.arrowImage];
    [self.headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(5);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.and.height.mas_equalTo(20);
    }];
    [self.headerImg layoutIfNeeded];
    self.headerImg.layer.cornerRadius = 10;
    self.headerImg.layer.masksToBounds = YES;
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(self.headerImg);
        make.left.equalTo(self.headerImg.mas_right).with.offset(5);
        make.width.mas_lessThanOrEqualTo(150);
    }];
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.width.and.height.mas_equalTo(30);
    }];
}

//- (void)setCoinModel:(CoinInfoModel *)coinModel{
//    _coinModel = coinModel;
//    NSString *url = [NSString stringWithFormat:@"%@%@",HttpMain,coinModel.imgs];
//    [self.headerImg sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageWithContentsOfFile:[POPCustomTools getImagePathWithImageName:@"Logo.jpg"]]];
//    self.nameLabel.text = coinModel.name.uppercaseString;
//    if ([coinModel.name isEqualToString:self.showName]) {
//        self.arrowImg.image = [UIImage imageWithContentsOfFile:[POPCustomTools getImagePathWithImageName:@"select20x20px@2x.png"]];
//    }else{
//        self.arrowImg.image = nil;
//    }
//}
//- (void)setMenModel:(MentionModel *)menModel{
//    _menModel = menModel;
//    NSString *url = [NSString stringWithFormat:@"%@%@",HttpMain,menModel.imgs];
//    [self.headerImg sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageWithContentsOfFile:[POPCustomTools getImagePathWithImageName:@"Logo.jpg"]]];
//    self.nameLabel.text = menModel.name.uppercaseString;
//    if ([menModel.name isEqualToString:self.showName]) {
//        self.arrowImg.image = [UIImage imageWithContentsOfFile:[POPCustomTools getImagePathWithImageName:@"select20x20px@2x.png"]];
//    }else{
//        self.arrowImg.image = nil;
//    }
//}
- (UIImageView *)headerImg{
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc] init];
        _headerImg.backgroundColor = [UIColor orangeColor];
    }
    return _headerImg;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = LXColor(161, 173, 194, 1);
        _nameLabel.backgroundColor = [UIColor yellowColor];
    }
    return _nameLabel;
}
- (UIImageView *)arrowImg{
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc] init];
//        _arrowImage.backgroundColor = [UIColor redColor];
    }
    return _arrowImage;
}
@end

