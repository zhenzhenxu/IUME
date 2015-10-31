//
//  UMNavgationController.m
//  IUME
//
//  Created by Crystal on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMNavgationController.h"

@interface UMNavgationController ()

@end

@implementation UMNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = KBlueBarTintColor;
    self.navigationBar.titleTextAttributes = @{
                                               NSForegroundColorAttributeName: [UIColor whiteColor],
                                               NSFontAttributeName: [UIFont boldSystemFontOfSize:22]
                                               };
}



@end
