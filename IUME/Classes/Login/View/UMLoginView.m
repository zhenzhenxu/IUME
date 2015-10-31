//
//  UMLoginView.m
//  IUME
//
//  Created by Crystal on 15/10/30.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMLoginView.h"
@interface UMLoginView()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *iconimgView;
@property (strong, nonatomic) IBOutlet UIImageView *bgline1;
@property (strong, nonatomic) IBOutlet UIImageView *bgline2;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end


@implementation UMLoginView

- (IBAction)loginViewBtn_click:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(loginViewBtnClick:)]) {
        [self.delegate loginViewBtnClick:sender];
    }
    
}

- (void)awakeFromNib{
    self.passwordTextField.delegate = self;
    self.phoneNumTextField.delegate = self;
    self.bgline1.userInteractionEnabled = YES;
    self.bgline2.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;

}



#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.phoneNumTextField) {
        [self.phoneNumTextField becomeFirstResponder];
    } else if (textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}

@end
