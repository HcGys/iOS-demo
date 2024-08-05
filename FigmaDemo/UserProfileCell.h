//
//  UserProfileCell.h
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface UserProfileCell : UITableViewCell

@property (nonatomic, strong) UIView *imageMask;
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UIImageView *userImageEditIcon;
@property (nonatomic, strong) UIImageView *userImageEditEllipse;

@property (nonatomic, strong) UIImageView * iconLeft;
@property (nonatomic, strong) UILabel * holderplace;
@property (nonatomic, strong) UILabel * value;
@property (nonatomic, strong) UIImageView * iconRight;

- (void) updateModelWithCell: (NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
