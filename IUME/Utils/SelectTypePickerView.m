//
//  SelectStockType.m
//  StockSystem
//
//  Created by Sandy.yu on 15/2/12.
//  Copyright (c) 2015年 Sandy. All rights reserved.
//

#import "SelectTypePickerView.h"

@implementation SelectTypePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithTitleArray:(NSArray*)titleArr keyArray:(NSArray*)keyArr delegate:(id)target{
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"SelectPickerView" owner:self options:nil] lastObject] ;
    if (self) {
        
        _titleArr=[titleArr copy];
        _delegate=target;
        if (keyArr) {
            _keyArr=[keyArr copy];//如果 keyarr＝＝nil，则 key＝title
        }else{
            _keyArr=_titleArr;
        }
        
        UIWindow* window=[UIApplication sharedApplication].keyWindow;
        _screenH=window.bounds.size.height;
        CGRect bounds = self.bounds;
        bounds.size.width = window.bounds.size.width;
        self.bounds = bounds;
        self.center=CGPointMake(self.bounds.size.width/2, _screenH+self.frame.size.height/2);
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

+ (SelectTypePickerView *)showWithTitleArray:(NSArray*)titleArr keyArray:(NSArray*)keyArr delegate:(id)target{
    SelectTypePickerView* selectView=[[SelectTypePickerView alloc]initWithTitleArray:titleArr keyArray:keyArr delegate:target];
    [selectView show];
    return selectView;
}

#pragma mark 发票类型选择

-(void)show{

    [UIView animateWithDuration:0.2 animations:^{
        [self setCenter:CGPointMake(self.frame.size.width/2, _screenH-self.frame.size.height/2)];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    [self cancelInvoiceType:nil];
}

-(IBAction)doneInvoiceType:(id)sender{
    //设置好当前发票类型，并刷新补充信息
    NSInteger row=-1;
    row=[pickerView selectedRowInComponent:0];
    if (row!=-1) {
        if ([self.delegate respondsToSelector:@selector(getRow:title:key:)]) {
            [self.delegate getRow:row title:_titleArr[row] key:_keyArr[row]];
        }
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        [self setCenter:CGPointMake(self.frame.size.width/2, _screenH+self.frame.size.height/2)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}
-(IBAction)cancelInvoiceType:(id)sender{
    if ([self.delegate respondsToSelector:@selector(getRow:title:key:)]) {
        [self.delegate getRow:-1 title:nil key:nil];
    }
    [UIView animateWithDuration:0.2 animations:^{
        [self setCenter:CGPointMake(self.frame.size.width/2, _screenH+self.frame.size.height/2)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
#pragma mark Picker Datasource Protocol

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 44;
}

//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _titleArr.count;
}

#pragma mark Picker Delegate Protocol
//设置当前行的内容
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    if(component==0){
//        
//       return  _titleArr[row];
//    }
//    return nil;
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 44)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, view.width-10*2, view.height)];
        label.text = _titleArr[row];
        label.numberOfLines = 2;
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        
        return view;
    }
    return nil;
}


@end
