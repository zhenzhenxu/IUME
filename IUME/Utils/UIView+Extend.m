//
//  UIView+Extend.m
//  xiwu
//
//  Created by yzk on 14-7-24.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "UIView+Extend.h"
#import "Utils.h"

@implementation UIView (Extend)

-(CGFloat)x         {   return CGRectGetMinX(self.frame);   }
-(CGFloat)y         {   return CGRectGetMinY(self.frame);   }
-(CGFloat)width     {   return CGRectGetWidth(self.frame);  }
-(CGFloat)height    {   return CGRectGetHeight(self.frame); }
-(CGPoint)origin    {   return self.frame.origin;           }
-(CGSize)size       {   return self.frame.size;             }
-(CGFloat)left      {   return CGRectGetMinX(self.frame);   }
-(CGFloat)right     {   return CGRectGetMaxX(self.frame);   }
-(CGFloat)top       {   return CGRectGetMinY(self.frame);   }
-(CGFloat)bottom    {   return CGRectGetMaxY(self.frame);   }
-(CGFloat)centerX   {   return self.center.x;               }
-(CGFloat)centerY   {   return self.center.y;               }
-(CGPoint)boundsCenter  {   return CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));   };

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    frame.size.width = MAX(self.right-left, 0);
    self.frame = frame;
}

-(void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.size.width = MAX(right-self.left, 0);
    self.frame = frame;
}

-(void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    frame.size.height = MAX(self.bottom-top, 0);
    self.frame = frame;
}

-(void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.size.height = MAX(bottom-self.top, 0);
    self.frame = frame;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (UIImage *)viewSnapshot
{
    return [self viewSnapshotWithOpaque:YES];
}

- (UIImage *)viewSnapshotWithOpaque:(BOOL)opaque
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, opaque, [UIScreen mainScreen].scale);
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    } else { // IOS7之前的版本
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIView *)addLineWithFrame:(CGRect)frame
                   lineColor:(UIColor *)lineColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = lineColor;
    [self addSubview:view];
    return view;
}

- (UIImageView *)addLineWithFrame:(CGRect)frame
                       imageNamed:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:imageView];
    return imageView;
}

- (void)addBorder
{
    [self addBorderWithWidth:2.0f];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
{
    [self addBorderWithWidth:borderWidth
                       color:[UIColor purpleColor]];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
{
    [self addBorderWithWidth:borderWidth
                       color:color
                      corner:0];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                    corner:(CGFloat)corner
{
    [self addBorderWithWidth:borderWidth
                       color:[UIColor purpleColor]
                      corner:corner];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
                    corner:(CGFloat)corner
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = corner;
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
           roundingCorners:(UIRectCorner)corners
              cornerRadius:(CGFloat)cornerRadius
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = borderWidth*2;
    layer.strokeColor = color.CGColor;
    layer.fillColor = nil;
    layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                       byRoundingCorners:corners
                                             cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    [self.layer addSublayer:layer];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                       byRoundingCorners:corners
                                             cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    self.layer.mask = maskLayer;
}


- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (NSInteger)depth
{
    NSInteger depth = 0;    
    if ([self superview])
    {
        depth = [[self superview] depth] + 1;
    }
    return depth;
}

- (NSString *)subHierarchy
{
    NSMutableString *debugInfo = [[NSMutableString alloc] initWithString:@"\n"];
    NSInteger depth = [self depth];
    
    for (int counter = 0; counter < depth; counter ++)
        [debugInfo appendString:@"|  "];
    
    [debugInfo appendFormat:@"%@: ( %.0f, %.0f, %.0f, %.0f )",NSStringFromClass([self class]),self.x,self.y,self.width,self.height];
    
    for (UIView *subview in self.subviews)
    {
        [debugInfo appendString:[subview subHierarchy]];
    }
    
    return debugInfo;
}

- (NSString *)superHierarchy
{
    NSMutableString *debugInfo = [[NSMutableString alloc] init];
    
    if (self.superview)
    {
        [debugInfo appendString:[self.superview superHierarchy]];
    }
    else
    {
        [debugInfo appendString:@"\n"];
    }
    
    NSInteger depth = [self depth];
    
    for (int counter = 0; counter < depth; counter ++)
        [debugInfo appendString:@"|  "];
    
    [debugInfo appendFormat:@"%@: ( %.0f, %.0f, %.0f, %.0f )\n",NSStringFromClass([self class]),self.x,self.y,self.width,self.height];
    
    return debugInfo;
}

- (UIView *)findSuperViewWithName:(NSString *)name
{
    for (UIView *superView = self; superView; superView = superView.superview) {
        Class cl = [superView class];
        NSString *desc = [cl description];
        if ([name isEqualToString:desc]) {
            return superView;
        }
    }
    return nil;
}

- (UIView *)findSubviewWithName:(NSString *)name
{
    Class cl = [self class];
    NSString *desc = [cl description];
    
    if ([name isEqualToString:desc])
        return self;
    
    for (NSUInteger i = 0; i < [self.subviews count]; i++)
    {
        UIView *subView = [self.subviews objectAtIndex:i];
        subView = [subView findSubviewWithName:name];
        if (subView)
            return subView;
    }
    return nil;
}

- (UIView *)findFirstResponderView
{
    if ([self isFirstResponder]) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        if ([subView findFirstResponderView]) {
            return [subView findFirstResponderView];
        }
    }
    return nil;
}

@end

@implementation UILabel (getTextHeight)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                      color:(UIColor *)color
{
    UILabel *label        = [[UILabel alloc] initWithFrame:frame];
    label.text            = text;
    label.font            = font;
    label.textColor       = color;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

- (double)getTextWidth
{
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    return [self getAttributedTextWidthWithAttributes:attributes];
}

- (double)getTextHeight;
{
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    return [self getAttributedTextHeightWithAttributes:attributes];
}

- (double)getAttributedTextWidthWithAttributes:(NSDictionary *)attributes
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                       attributes:attributes
                                          context:nil];
    
    return ceil(rect.size.width);
    
#else
    CGSize size = [self.text sizeWithFont:self.font
                        constrainedToSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
    return ceil(size.width);
#endif
}

- (double)getAttributedTextHeightWithAttributes:(NSDictionary *)attributes
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                       attributes:attributes
                                          context:nil];
    return ceil(rect.size.height);
#else
    CGSize size = [self.text sizeWithFont:self.font
                        constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return ceil(size.height);
#endif
}

@end


@implementation UIButton (Extend)

- (void)setTitle:(NSString *)title
{
    [self setTitle:title
          forState:UIControlStateNormal];
    [self setTitle:title
          forState:UIControlStateDisabled];
}

- (NSString *)title
{
    return [self titleForState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateDisabled];
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchUpInside];
}

@end



@implementation UIScrollView (AutoContentSize)

- (void)autoContentSize
{
    [self autoContentSizeWithSpace:10];
}

- (void)autoContentSizeWithSpace:(float)space
{
    float maxRight = 0;
    float maxBottom = 0;
    for( UIView *sub in self.subviews ){
        if( sub.hidden ){
            continue;
        }
        float bottom = sub.frame.origin.y + sub.frame.size.height;
        float right = sub.frame.origin.x + sub.frame.size.width;
        maxBottom = ( bottom > maxBottom ) ? bottom:maxBottom;
        maxRight = (right > maxRight )? right: maxRight;
    }
    
    self.contentSize = CGSizeMake(maxRight, maxBottom + space);
}

@end



