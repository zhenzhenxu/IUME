//
//  UMRegisterVC.m
//  IUME
//
//  Created by 珍 on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMRegisterVC.h"
#import "UMRegisterView.h"
@interface UMRegisterVC()<registerViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UMRegisterView *registerView;
@end
@implementation UMRegisterVC
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];
    self.title = @"注册";

}

- (void)setupUI{
    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    

    _registerView = [[[NSBundle mainBundle] loadNibNamed:@"UMRegisterVew" owner:nil options:nil]lastObject];
    [_scrollView addSubview:_registerView];
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_scrollView.mas_width);
        make.height.equalTo(@667);
    }];
    _registerView.delegate = self;
    
    

}




#pragma mark registerViewDelegate

- (void)registerViewBtnClick:(UIButton *)btn{

    switch (btn.tag) {
        case 32://验证
            
            break;
        case 33://密码明文切换
            
            break;
        case 34:// 登录
            
            break;
            
        default:
            break;
    }

}

@end
