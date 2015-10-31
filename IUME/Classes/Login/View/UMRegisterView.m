//
//  UMRegisterView.m
//  IUME
//
//  Created by 珍 on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMRegisterView.h"
@interface UMRegisterView()
@property (strong, nonatomic) IBOutlet UIImageView *statusImg;

@property (strong, nonatomic) IBOutlet UITextField *verticalTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumTextField;

@end
@implementation UMRegisterView
- (IBAction)registerViewBtn_click:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(registerViewBtnClick:)]) {
        [self.delegate registerViewBtnClick:sender];
    }
    
    
}



@end
