//
//  TextTableViewCell.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/31.
//

#import "TextTableViewCell.h"
#import <Masonry/Masonry.h>

#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@implementation TextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self layoutCell];
    
    return self;
}

- (void)updateCellWithDic:(NSDictionary *)dic {
    [_leftIconImageView setImage:[UIImage imageNamed:dic[@"leftIcon"]]];
    _holderplaceLabel.text = dic[@"holderplace"];
    [_rightIconImageView setImage:[UIImage imageNamed:dic[@"rightIcon"]]];
    
    if (!dic[@"separator"] || ![dic[@"separator"] isEqualToString:@"yes"]) {
        _separatorView.alpha = 0.0;
    }
    
}

- (void) layoutCell {
    [self.contentView addSubview:self.leftIconImageView];
    [self.contentView addSubview:self.holderplaceLabel];
    [self.contentView addSubview:self.rightIconImageView];
    [self.contentView addSubview:self.separatorView];
    
    [_leftIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(16);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(24);
    }];
    
    [_holderplaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.bottom.mas_equalTo(-16);
        make.leading.equalTo(_leftIconImageView.mas_trailing).offset(12);
    }];
    
    [_rightIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(-16);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.leading.equalTo(_holderplaceLabel.mas_trailing).offset(16);
        make.width.height.mas_equalTo(24);
    }];
    
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(16);
        make.trailing.mas_equalTo(-16);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark -- lazy load

- (UIImageView *)leftIconImageView {
    if (!_leftIconImageView) {
        _leftIconImageView = [[UIImageView alloc] init];
    }
    return _leftIconImageView;
}

- (UILabel *)holderplaceLabel {
    if (!_holderplaceLabel) {
        _holderplaceLabel = [[UILabel alloc] init];
        _holderplaceLabel.textColor = RGB(36, 36, 36);
        _holderplaceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _holderplaceLabel;
}

- (UIImageView *)rightIconImageView {
    if (!_rightIconImageView) {
        _rightIconImageView = [[UIImageView alloc] init];
    }
    return _rightIconImageView;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = RGB(239, 239, 247);
    }
    return _separatorView;
}

@end
