//
//  TextAndIconButton.h
//  FigmaDemo
//
//  Created by IOS on 2024/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextAndIconButton : UIView

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) void (^clickEventBlock)(void);

- (instancetype) initWithText: (NSString *)text icon: (NSString *)icon;

@end

NS_ASSUME_NONNULL_END
