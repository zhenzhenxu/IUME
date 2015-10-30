//
//  UMLoginVC.m
//  IUME
//
//  Created by Crystal on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMLoginVC.h"

@interface UMLoginVC ()
{
    UIScrollView *_scrollView;
}

@end

@implementation UMLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    

}
@end
