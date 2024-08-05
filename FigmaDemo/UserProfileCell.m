//
//  UserProfileCell.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import "UserProfileCell.h"

#import <Masonry/Masonry.h>

//颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

//字体
#define BoldSystemFont(size)     [UIFont boldSystemFontOfSize:size]
#define systemFont(size)         [UIFont systemFontOfSize:size]

@implementation UserProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([reuseIdentifier isEqualToString:@"image"]) {
        [self layoutImageCell];
    } else if ([reuseIdentifier isEqualToString:@"text"]) {
        [self layoutTextCell];
    }
    
    return self;
}

- (void) layoutTextCell {
    [self.contentView addSubview:self.iconLeft];
    [self.contentView addSubview:self.holderplace];
    [self.contentView addSubview:self.value];
    [self.contentView addSubview:self.iconRight];
    
    
    [_iconLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(16);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(24);
    }];
    
    [_holderplace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_iconLeft.mas_trailing).offset(8);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [_value mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.bottom.mas_equalTo(-16);
        make.leading.equalTo(_holderplace.mas_trailing).offset(8);
    }];
    
    [_iconRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.leading.mas_equalTo(_value.mas_trailing).offset(8);
        make.trailing.mas_equalTo(-8);
        make.width.height.mas_equalTo(24);
    }];
    
//    [_holderplace setFocusGroupPriority:UILayoutPriorityDefaultHigh];
//    [_value setFocusGroupPriority:UILayoutPriorityDefaultLow];
    
}

- (void) layoutImageCell {
    [self.contentView addSubview:self.userImage];
    [self.contentView addSubview:self.userImageEditEllipse];
    [self.contentView addSubview:self.userImageEditIcon];
    [self.contentView addSubview:self.imageMask];
    
    [_userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(54);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-54);
        make.top.mas_equalTo(54);
    }];
    
    [_imageMask mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_userImage.mas_bottom).offset(0);
        make.trailing.equalTo(_userImage.mas_trailing).offset(0);
        make.height.width.mas_equalTo(102);
    }];
    
    [_userImageEditEllipse mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_userImage.mas_bottom).offset(-1);
        make.trailing.mas_equalTo(_userImage.mas_trailing).offset(-1);
    }];
    
    [_userImageEditIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_userImage.mas_bottom).offset(-8);
        make.trailing.mas_equalTo(_userImage.mas_trailing).offset(-8);
    }];
}

- (void) updateModelWithCell: (NSDictionary *) dict {
    if ([dict[@"identifier"] isEqualToString:@"image"]) {
        [self updateImageModelWithCell:dict];
    } else if ([dict[@"identifier"] isEqualToString:@"text"]) {
        [self updateTextModelWithCell:dict];
    }
}

- (void) updateImageModelWithCell: (NSDictionary *) dict {
    UIImage *img = [UIImage imageNamed:dict[@"userImage"]];
    [self.userImage setImage:img];
    
    UIImage *imgEditIcon = [UIImage imageNamed:dict[@"userImageEdit"]];
    [self.userImageEditIcon setImage:imgEditIcon];
    
    UIImage *imgEditEllipse = [UIImage imageNamed:dict[@"userImageEditEllipse"]];
    [self.userImageEditEllipse setImage:imgEditEllipse];
}

- (void) updateTextModelWithCell: (NSDictionary *) dict {
    UIImage *iconLeft = [UIImage imageNamed:dict[@"iconLeft"]];
    [self.iconLeft setImage:iconLeft];
    
    self.holderplace.text = dict[@"holderplace"];
    
    self.value.text = dict[@"value"];
    if (dict[@"color"]) {
        self.value.textColor = dict[@"color"];
    }
    
    if (!dict[@"more"] || [dict[@"more"] isEqualToString:@"yes"]) {
        UIImage *iconRight = [UIImage imageNamed:dict[@"iconRight"]];
        [self.iconRight setImage:iconRight];
    }
}

#pragma mark -- lazy load

- (UIView *)imageMask {
    if (!_imageMask) {
        _imageMask = [[UIView alloc] init];
        _imageMask.backgroundColor = RGBA(226, 0, 32, .2);
    }
    return _imageMask;
}

- (UIImageView *)userImage {
    if (!_userImage) {
        _userImage = [[UIImageView alloc] init];
    }
    return _userImage;
}

- (UIImageView *)userImageEditIcon {
    if (!_userImageEditIcon) {
        _userImageEditIcon = [[UIImageView alloc] init];
    }
    return _userImageEditIcon;
}

- (UIImageView *)userImageEditEllipse {
    if (!_userImageEditEllipse) {
        _userImageEditEllipse = [[UIImageView alloc] init];
    }
    return _userImageEditEllipse;
}

- (UIImageView *)iconLeft {
    if (!_iconLeft) {
        _iconLeft = [[UIImageView alloc] init];
    }
    return _iconLeft;
}

- (UIImageView *)iconRight {
    if (!_iconRight) {
        _iconRight = [[UIImageView alloc] init];
    }
    return _iconRight;
}

- (UILabel *)holderplace {
    if (!_holderplace) {
        _holderplace = [[UILabel alloc] init];
        _holderplace.textColor = RGB(36, 36, 36);
        _holderplace.font = systemFont(16);
    }
    return _holderplace;
}

- (UILabel *)value {
    if (!_value) {
        _value = [[UILabel alloc] init];
        _value.textColor = RGB(133, 133, 133);
        _value.font = systemFont(16);
        _value.textAlignment = NSTextAlignmentRight;
        _value.numberOfLines = 0;
    }
    return _value;
}

@end
