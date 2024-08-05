//
//  User.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import "User.h"

@implementation User

- (instancetype)initWithID:(NSString *)ID NickName:(NSString *)nickName email:(NSString *)email {
    if (self = [super init]) {
        self.ID = ID;
        self.nickName = nickName;
        self.email = email;
    }
    return self;
}

@end
