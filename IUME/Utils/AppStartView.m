//
//  AppStartView.m
//  GeorgeBaseProject
//
//  Created by George on 15/3/20.
//  Copyright (c) 2015年 george. All rights reserved.
//

#import "AppStartView.h"
#import "UIImageView+WebCache.h"
@interface AppStartView()
@property (strong, nonatomic) UIImageView *bgImageView;

@end
@implementation AppStartView


+ (instancetype)startViewWithUrl:(NSURL *)url{
    return [[self alloc] initWithURL:url] ;
}

- (instancetype)initWithURL:(NSURL *)url{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        //add custom code
        self.backgroundColor = [UIColor colorWithRed:13/255.0 green:13/255.0  blue:13/255.0  alpha:1 ];

        _bgImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.alpha = 0.0;
        [_bgImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bg_setting"]];
        [self addSubview:_bgImageView];

    }
    return self;
}

- (void)startAnimationWithCompletionBlock:(void(^)(AppStartView *easeStartView))completionHandler{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    _bgImageView.alpha = 0.0;
    self.alpha = 1.0;
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:2.0 animations:^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.bgImageView.alpha = 1.0;
        [strongSelf.bgImageView setFrame:CGRectMake(-[UIScreen mainScreen].bounds.size.width/20, -[UIScreen mainScreen].bounds.size.height/20, 1.1*[UIScreen mainScreen].bounds.size.width, 1.1*[UIScreen mainScreen].bounds.size.height)];
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.bgImageView.alpha = 0.0;
            strongSelf.alpha = 0.0;
        } completion:^(BOOL finished) {
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf removeFromSuperview];
            if (completionHandler) {
                completionHandler(strongSelf);
            }
        }];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
