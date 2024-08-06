//
//  ViewController.m
//  FigmaDemo
//
//  Created by IOS on 2024/7/30.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "TextTableViewCell.h"
#import "UserProfileNavigationBar.h"
#import "TextAndIconButton.h"
#import <Masonry/Masonry.h>

#define RGB(r,g,b)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


static NSString *identifier = @"text";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;

@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) UserProfileNavigationBar *userProfileNavigationBar;

@property (nonatomic, strong) TextAndIconButton *subscriptionButton;
@property (nonatomic, strong) TextAndIconButton *orderButton;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UIView *topButtonsContainerView;

@property (nonatomic, strong) TextAndIconButton *homeButton;
@property (nonatomic, strong) TextAndIconButton *serviceButton;
@property (nonatomic, strong) TextAndIconButton *meButton;
@property (nonatomic, strong) UIView *bottomButtonsContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGB(230, 230, 230);
   
    [self layoutNavigationBar];
    [self layoutTopButtons];
    [self layoutTable];
    [self layoutBottomButtons];
  
    [_userProfileNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
        make.height.mas_equalTo(220);
        make.bottom.equalTo(_tableView.mas_top).offset(-64);
    }];
    [_topButtonsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userProfileNavigationBar.mas_bottom).offset(-36);
        make.leading.mas_equalTo(16);
        make.trailing.mas_equalTo(-16);
        make.bottom.equalTo(_tableView.mas_top).offset(-16);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-150);
        make.leading.mas_equalTo(16);
        make.trailing.mas_equalTo(-16);
//        make.height.mas_equalTo([self calculateTableViewHeight]);
    }];
    [_bottomButtonsContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.leading.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
        make.height.mas_equalTo(80);
//        make.height.mas_equalTo([self calculateTableViewHeight]);
    }];
}

- (void) layoutNavigationBar {
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.toolbar.hidden = NO;
    
    [self.userProfileNavigationBar updateNavigationBarWithDic:self.userInfo];
//    //初始化CAGradientlayer对象，使它的大小为UIView的大小
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
//    //设置渐变区域的起始和终止位置（范围为0-1）
//    //设置（1，0）为横向，设置（0，1）为纵向，设置（1，1）为对角方向
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 1);
//    //设置颜色数组
//    gradientLayer.colors = @[(__bridge id)RGB(26, 24, 134).CGColor, (__bridge id)RGB(44, 49, 140).CGColor];
//    //设置颜色分割点（范围：0-1）
//    gradientLayer.locations = @[@(0.0f), @(1.0f)];
//    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
//    [_userProfileNavigationBar.layer addSublayer:gradientLayer];
    _userProfileNavigationBar.backgroundColor = RGB(26, 24, 134);
    __block ViewController *weakSelf = self;
    _userProfileNavigationBar.clickUserProfile = ^{
        [weakSelf jumpTwoVC];
    };
    [self.view addSubview:_userProfileNavigationBar];
}

- (void) layoutTopButtons {
    [self.topButtonsContainerView addSubview:self.subscriptionButton];
    [_topButtonsContainerView addSubview:self.separatorView];
    [_topButtonsContainerView addSubview:self.orderButton];
    [self.view addSubview:_topButtonsContainerView];
    
    [_subscriptionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.width.mas_equalTo((self.view.bounds.size.width - 33) / 2);
    }];
    
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21);
        make.bottom.mas_equalTo(-21);
        make.width.mas_equalTo(1);
        make.leading.equalTo(_subscriptionButton.mas_trailing).offset(0);
    }];
    
    [_orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_separatorView.mas_trailing).offset(0);
        make.trailing.mas_equalTo(0);
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
    }];
}

- (void) layoutTable {
    [self.view addSubview:self.tableView];
}

- (void) layoutBottomButtons {
    [self.bottomButtonsContainerView addSubview:self.homeButton];
    [_bottomButtonsContainerView addSubview:self.serviceButton];
    [_bottomButtonsContainerView addSubview:self.meButton];
    [self.view addSubview:_bottomButtonsContainerView];
    
    [_homeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(4);
        make.bottom.mas_equalTo(-31);
        make.width.mas_equalTo((self.view.bounds.size.width) / 3);
    }];
    
    [_serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_homeButton.mas_trailing).offset(0);
        make.top.mas_equalTo(4);
        make.width.mas_equalTo((self.view.bounds.size.width) / 3);
    }];
    
    [_meButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_serviceButton.mas_trailing).offset(0);
        make.top.mas_equalTo(4);
        make.width.mas_equalTo((self.view.bounds.size.width) / 3);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.separatorInset = UIEdgeInsetsMake(0, 25, 0, 0);
    
    [cell updateCellWithDic:_tableData[indexPath.section][indexPath.row]];
    
    return cell;
}

- (void) jumpTwoVC {
    TwoViewController *twoViewVC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoViewVC animated:YES];
}

- (int) calculateTableViewHeight {
    int height = 0;
    for (int i = 0; i < [_tableView numberOfSections]; ++i) {
        for (int j = 0; j < [_tableView numberOfRowsInSection:i]; ++j) {
            TextTableViewCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            height += cell.bounds.size.height;
        }
    }
    return height;
}

#pragma mark -- lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.layer.cornerRadius = 16;
        _tableView.layer.borderColor = [RGB(27, 27, 27) CGColor];
        _tableView.scrollEnabled = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray *)tableData {
    if (!_tableData) {
        _tableData = @[
            @[
                @{
                    @"leftIcon": @"information",
                    @"holderplace": @"Basic Information",
                    @"rightIcon": @"more",
                    @"separator": @"yes"
                },
                @{
                    @"leftIcon": @"telco",
                    @"holderplace": @"Telco Information",
                    @"rightIcon": @"more",
                    @"separator": @"yes"
                },
                @{
                    @"leftIcon": @"parentAndChild",
                    @"holderplace": @"Parent & Child",
                    @"rightIcon": @"more",
                    @"separator": @"yes"
                }
            ],
            @[
                @{
                    @"leftIcon": @"face",
                    @"holderplace": @"Face Information",
                    @"rightIcon": @"more",
                },
                @{
                    @"leftIcon": @"FAQ",
                    @"holderplace": @"FAQ",
                    @"rightIcon": @"more",
                    @"separator": @"yes"
                },
            ],
            @[
                @{
                    @"leftIcon": @"settings",
                    @"holderplace": @"Settings",
                    @"rightIcon": @"more",
                },
                @{
                    @"leftIcon": @"termsAndConditions",
                    @"holderplace": @"Terms&conditions",
                    @"rightIcon": @"more",
                },
                @{
                    @"leftIcon": @"privatePolicy",
                    @"holderplace": @"Private policy",
                    @"rightIcon": @"more",
                }
            ],
        ];
    }
    return _tableData;
}

- (NSDictionary *)userInfo {
    if (!_userInfo) {
        _userInfo = @{
            @"name": @"Daryl",
            @"id": @"ECO9889878",
            @"image": @""
        };
    }
    return _userInfo;;
}

- (UserProfileNavigationBar *)userProfileNavigationBar {
    if (!_userProfileNavigationBar) {
        _userProfileNavigationBar = [[UserProfileNavigationBar alloc]init];
    }
    return _userProfileNavigationBar;
}

- (TextAndIconButton *)subscriptionButton {
    if (!_subscriptionButton) {
        _subscriptionButton = [[TextAndIconButton alloc] initWithText:@"Subscription" icon:@"subscription"];
        _subscriptionButton.clickEventBlock = ^{
            NSLog(@"click subscription button");
        };
    }
    return _subscriptionButton;
}

- (TextAndIconButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [[TextAndIconButton alloc] initWithText:@"Order" icon:@"order"];
        _orderButton.clickEventBlock = ^{
            NSLog(@"click order button");
        };
    }
    return _orderButton;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [[UIView alloc]init];
        _separatorView.backgroundColor = RGB(239, 230, 247);
    }
    return _separatorView;
}

- (UIView *)topButtonsContainerView {
    if (!_topButtonsContainerView) {
        _topButtonsContainerView = [[UIView alloc] init];
        _topButtonsContainerView.backgroundColor = [UIColor whiteColor];
        _topButtonsContainerView.layer.cornerRadius = 16;
        _topButtonsContainerView.layer.borderColor = [RGB(27, 27, 27) CGColor];
    }
    return _topButtonsContainerView;
}

- (TextAndIconButton *)homeButton {
    if (!_homeButton) {
        _homeButton = [[TextAndIconButton alloc]initWithText:@"Home" icon:@"home"];
    }
    return _homeButton;
}

- (TextAndIconButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [[TextAndIconButton alloc]initWithText:@"Service" icon:@"service"];
    }
    return _serviceButton;
}

- (TextAndIconButton *)meButton {
    if (!_meButton) {
        _meButton = [[TextAndIconButton alloc]initWithText:@"Me" icon:@"me"];
    }
    return _meButton;
}

- (UIView *)bottomButtonsContainerView {
    if (!_bottomButtonsContainerView) {
        _bottomButtonsContainerView = [[UIView alloc] init];
        _bottomButtonsContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomButtonsContainerView;
}

@end
