//
//  TextAndIconButton.m
//  FigmaDemo
//
//  Created by IOS on 2024/8/2.
//

#import "TextAndIconButton.h"
#import <Masonry/Masonry.h>

#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation TextAndIconButton

- (instancetype) initWithText: (NSString *)text icon: (NSString *)icon {
    if (self = [super init]) {
        self.textLabel.text = text;
        [self.iconImageView setImage:[UIImage imageNamed:icon]];
        [self addSubview:_iconImageView];
        [self addSubview:_textLabel];
        [self layoutTextAndIconButton];
        
        //添加item的点击事件， self是当前UIView
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(clickEventBlock:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) layoutTextAndIconButton {
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.equalTo(_textLabel.mas_top).offset(-4);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

- (void) clickEventBlock: (UITapGestureRecognizer *)gesture {
    if (self.clickEventBlock) {
        self.clickEventBlock();
    }
}

#pragma mark -- lazy load

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = RGB(36, 36, 36);
        _textLabel.font = [UIFont systemFontOfSize:14];
    }
    return _textLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

@end
