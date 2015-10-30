//
//  SelectStockType.h
//  StockSystem
//
//  Created by Sandy.yu on 15/2/12.
//  Copyright (c) 2015年 Sandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTypePickerViewDelegate<NSObject>

@required
-(void)getRow:(NSInteger)row title:(NSString*)title key:(NSString*)keyString;
@end

@interface SelectTypePickerView : UIView
<UIPickerViewDataSource,
UIPickerViewDelegate>
{
    NSArray* _titleArr;
    NSArray* _keyArr;
    float _screenH;
    SelectTypePickerView* selectView;

    IBOutlet UIPickerView* pickerView;
}
@property(nonatomic,assign)id<SelectTypePickerViewDelegate>delegate;

+ (SelectTypePickerView *)showWithTitleArray:(NSArray*)titleArr keyArray:(NSArray*)keyArr delegate:(id<SelectTypePickerViewDelegate>)target;

- (void)dismiss;

@end
