//
//  UMResumeCell.m
//  IUME
//
//  Created by 珍 on 15/10/31.
//  Copyright © 2015年 UME. All rights reserved.
//

#import "UMResumeCell.h"
#import "UMResumeMD.h"
@interface UMResumeCell()
@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *joblbl;
@property (strong, nonatomic) IBOutlet UILabel *yearlimitlbl;
@property (strong, nonatomic) IBOutlet UILabel *xulilbl;
@property (strong, nonatomic) IBOutlet UILabel *scorelbl;
@property (strong, nonatomic) IBOutlet UILabel *statuslbl;
@end
@implementation UMResumeCell

- (void)awakeFromNib {
    
}

- (void)setCellModel:(UMResumeMD *)cellModel{
    _cellModel = cellModel;
    _yearlimitlbl.text = cellModel.gznx;
    _xulilbl.text = cellModel.xl;
    _namelbl.text = cellModel.name;
    _scorelbl.text = cellModel.spare4;
    _joblbl.text = @"UI设计师";
    NSString *timeStr =cellModel.spare5;
    NSString *tempstr= [timeStr substringFromIndex:5];   
    NSRange range =[tempstr rangeOfString:@"-"];
    _statuslbl.text = [NSString stringWithFormat:@"%@/%@",[tempstr substringToIndex:range.location],[tempstr substringFromIndex:range.location+1]];

}
@end
