//
//  UserProfileNavigationBar.m
//  FigmaDemo
//
//  Created by IOS on 2024/8/1.
//

#import "UserProfileNavigationBar.h"
#import <Masonry/Masonry.h>

#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation UserProfileNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self layoutNavigationBar];
    }
    return self;
}

- (void) layoutNavigationBar {

    [self addSubview:self.rectangleMaskLeft];
    [self addSubview:self.rectangleMaskRight];
    [self.titleContentView addSubview:self.titleLabel];
    [self addSubview:_titleContentView];
    [self addSubview:self.userIconIamgeView];
    [self addSubview:self.userNameLabel];
    [self addSubview:self.userIdLabel];
    [self addSubview:self.userProfileMaskView];
    
    [_rectangleMaskLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.mas_equalTo(0);
    }];
    
    [_rectangleMaskRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(9);
        make.bottom.mas_equalTo(-8);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [_titleContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(44);
        make.leading.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
    }];
    
    [_userProfileMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleContentView.mas_bottom).offset(11);
        make.leading.mas_equalTo(24);
        make.bottom.mas_equalTo(-58);
    }];
    
    [_userIconIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userProfileMaskView.mas_top).offset(0);
        make.bottom.equalTo(_userProfileMaskView.mas_bottom).offset(0);
        make.leading.equalTo(_userProfileMaskView.mas_leading).offset(0);
        make.width.height.mas_equalTo(60);
    }];
    
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userProfileMaskView.mas_top).offset(7);
        make.leading.equalTo(_userIconIamgeView.mas_trailing).offset(8);
    }];
    
    [_userIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameLabel.mas_bottom).offset(0);
        make.leading.equalTo(_userIconIamgeView.mas_trailing).offset(8);
        make.bottom.equalTo(_userProfileMaskView.mas_bottom).offset(-4);
        make.trailing.equalTo(_userProfileMaskView.mas_trailing).offset(0);
    }];
}

- (void) updateNavigationBarWithDic: (NSDictionary *)dic {
    if (![dic[@"image"] isEqualToString:@""]) {
        [_userIconIamgeView setImage:dic[@"image"]];
    }
    _userNameLabel.text = dic[@"name"];
    _userIdLabel.text = [NSString stringWithFormat:@"GAIA ID: %@", dic[@"id"]];
}

- (void) clickUserProfile: (UITapGestureRecognizer *)tapGesture {
    if (self.clickUserProfile) {
        self.clickUserProfile();
    }
}

#pragma mark -- lazy load

- (UIImageView *)rectangleMaskLeft {
    if (!_rectangleMaskLeft) {
        _rectangleMaskLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rectangleMaskLeft"]];
        _rectangleMaskLeft.alpha = 0.1;
    }
    return _rectangleMaskLeft;
}

- (UIImageView *)rectangleMaskRight {
    if (!_rectangleMaskRight) {
        _rectangleMaskRight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rectangleMaskRight"]];
        _rectangleMaskRight.alpha = 0.1;
    }
    return _rectangleMaskRight;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18 weight:500];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"Me";
    }
    return _titleLabel;
}

- (UIImageView *)userIconIamgeView {
    if (!_userIconIamgeView) {
        _userIconIamgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userImageDefault"]];
    }
    return _userIconIamgeView;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textColor = [UIColor whiteColor];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _userNameLabel;
}

- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc] init];
        _userIdLabel.textColor = RGB(163, 163, 207);
        _userIdLabel.textAlignment = NSTextAlignmentCenter;
        _userIdLabel.font = [UIFont systemFontOfSize:14];
    }
    return _userIdLabel;
}

- (UIButton *)userProfileMaskView {
    if (!_userProfileMaskView) {
        _userProfileMaskView = [[UIButton alloc] init];
//        _userProfileMaskView.backgroundColor = RGBA(226, 0, 32, .2);
        [_userProfileMaskView addTarget:self action:@selector(clickUserProfile:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _userProfileMaskView;
}

- (UIView *)titleContentView {
    if (!_titleContentView) {
        _titleContentView = [[UIView alloc] init];
    }
    return _titleContentView;
}

@end
