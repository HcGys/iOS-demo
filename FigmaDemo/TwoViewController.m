//
//  FirstViewController.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/31.
//

#import "TwoViewController.h"

#import "User.h"
#import "UserProfileCell.h"
#import <Masonry/Masonry.h>

#define HEADER_ICON_LEFT @"back"
#define HEADER_TITLE_TEXT @"My Profile"

#define USER_IMAGE_DEFAULT @"userImageDefault"
#define USER_IMAGE_EDIT_ICON @"editIcon"
#define USER_IMAGE_EDIT_ELLIPSE @"ellipse"

#define USER_ID_ICON_LEFT @"userID"
#define USER_ID_ICON_RIGHT @"more"
#define USER_ID_TEXT @"GAIA ID"

#define USER_NICKNAME_ICON_LEFT @"userNickName"
#define USER_NICKNAME_ICON_RIGHT @"more"
#define USER_NICKNAME_TEXT @"Nick Name"

#define USER_PHONE_ICON_LEFT @"userPhone"
#define USER_PHONE_ICON_RIGHT @"more"
#define USER_PHONE_TEXT @"Sign-in Mobile Number"
#define USER_NO_PHONE @"Add"

#define USER_EMAIL_ICON_LEFT @"userEmail"
#define USER_EMAIL_ICON_RIGHT @"more"
#define USER_EMAIL_TEXT @"Sign-in Email"

#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

static NSString *identifier = @"";

@interface TwoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *userProfile;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = HEADER_TITLE_TEXT;
    self.navigationController.navigationBar.hidden = NO;
    UIButton *backButton = [[UIButton alloc] init];
    [backButton setImage:[UIImage imageNamed:HEADER_ICON_LEFT] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    [self.view addSubview:self.tableView];
    
    [self initData];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void) initData {
    User *user = [[User alloc] initWithID:@"ECO9889878" NickName:@"Dary" email:@"matareQgmail.com"];
    
    [self.userProfile addObject:@{@"identifier" : @"image", @"userImage": user.image ? user.image : USER_IMAGE_DEFAULT, @"userImageEdit": USER_IMAGE_EDIT_ICON, @"userImageEditEllipse": USER_IMAGE_EDIT_ELLIPSE}];
    [self.userProfile addObject:@{@"identifier" : @"text", @"value" : user.ID, @"iconLeft" : USER_ID_ICON_LEFT, @"holderplace": USER_ID_TEXT, @"iconRight": USER_ID_ICON_RIGHT, @"more": @"no"}];
    [self.userProfile addObject:@{@"identifier" : @"text", @"value" : user.nickName, @"iconLeft" : USER_NICKNAME_ICON_LEFT, @"holderplace": USER_NICKNAME_TEXT, @"iconRight": USER_NICKNAME_ICON_RIGHT}];
    [self.userProfile addObject:@{@"identifier" : @"text", @"value" : user.phone ? user.phone: USER_NO_PHONE, @"iconLeft" : USER_PHONE_ICON_LEFT, @"holderplace": USER_PHONE_TEXT, @"iconRight": USER_PHONE_ICON_RIGHT, @"color": user.phone ? RGB(133, 133, 133): RGB(26, 24, 134)}];
    [self.userProfile addObject:@{@"identifier" : @"text", @"value" : user.email, @"iconLeft" : USER_EMAIL_ICON_LEFT, @"holderplace": USER_EMAIL_TEXT, @"iconRight": USER_EMAIL_ICON_RIGHT}];
}

- (void) clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _userProfile.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    identifier = [self.userProfile[indexPath.row] objectForKey:@"identifier"];
    
    UserProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UserProfileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell updateModelWithCell:self.userProfile[indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    UIImage *headerLeftIcon = [UIImage imageNamed:HEADER_ICON_LEFT];
    UIImageView *leftIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24.56)];
    [leftIconView setImage:headerLeftIcon];
    
    UILabel *headerTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 88, 27)];
    headerTextLabel.text = HEADER_TITLE_TEXT;
    headerTextLabel.font = [UIFont boldSystemFontOfSize:18];
    headerTextLabel.textColor = [UIColor colorWithRed:0.141 green:0.141 blue:0.141 alpha:1];
    headerTextLabel.textAlignment = NSTextAlignmentCenter;
    
    [content addSubview:leftIconView];
    [content addSubview:headerTextLabel];
    
    [leftIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(content.mas_leading).offset(16);
        make.centerY.mas_equalTo(content.mas_centerY);
    }];
    
    [headerTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(content.mas_centerX);
        make.centerY.mas_equalTo(content.mas_centerY);
        
    }];
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


#pragma mark -- lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _tableView.separatorInset = UIEdgeInsetsZero;
    }
    return _tableView;
}

- (NSArray *)userProfile {
    if (!_userProfile) {
        _userProfile = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return _userProfile;
}

@end
