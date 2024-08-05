//
//  UserProfileNavigationBar.h
//  FigmaDemo
//
//  Created by IOS on 2024/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserProfileNavigationBar : UINavigationBar

@property (nonatomic, strong) UIImageView *rectangleMaskRight;
@property (nonatomic, strong) UIImageView *rectangleMaskLeft;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *titleContentView;

@property (nonatomic, strong) UIImageView *userIconIamgeView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userIdLabel;
@property (nonatomic, strong) UIButton *userProfileMaskView;

@property (nonatomic, strong) void (^clickUserProfile)(void);

- (void) updateNavigationBarWithDic: (NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
