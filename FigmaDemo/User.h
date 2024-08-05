//
//  User.h
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *image;

- (instancetype) initWithID: (NSString *) ID NickName: (NSString *) nickName email: (NSString *) email;

@end

NS_ASSUME_NONNULL_END
