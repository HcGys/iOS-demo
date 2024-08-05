//
//  TextTableViewCell.h
//  FigmaDemo
//
//  Created by IOS on 2024/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftIconImageView;
@property (nonatomic, strong) UILabel *holderplaceLabel;
@property (nonatomic, strong) UIImageView *rightIconImageView;
@property (nonatomic, strong) UIView *separatorView;

- (void) updateCellWithDic: (NSDictionary *) dic;

@end

NS_ASSUME_NONNULL_END
