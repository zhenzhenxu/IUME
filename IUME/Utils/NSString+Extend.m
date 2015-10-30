//
//  NSString+Extend.m
//  PatDog
//
//  Created by yzk on 14-8-12.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "NSString+Extend.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extend)

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];      
}

- (BOOL)isLegal
{
    return [self isLegalTrimmingWhitespace:YES];
}

- (BOOL)isLegalTrimmingWhitespace:(BOOL)isTrim
{
    if (self == nil || [self length]== 0) {
        return NO;
    }
    if (isTrim) {
        if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
            return NO;
        }
    }
    
    return YES;
}

- (double)getTextHeightWithFont:(UIFont *)font width:(CGFloat)width
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    return ceil(rect.size.height);
#else
    CGSize size = [self sizeWithFont:font
                   constrainedToSize:CGSizeMake(width, MAXFLOAT)];
    return ceil(size.height);
#endif
}

- (double)getTextWidthWithFont:(UIFont *)font height:(CGFloat)height
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    return ceil(rect.size.width);
#else
    CGSize size = [self sizeWithFont:font
                   constrainedToSize:CGSizeMake(MAXFLOAT, height)];
    return ceil(size.width);
#endif
}

-(NSString *)changeChar{
    NSString *str = self;
    for (NSInteger i = 1; i < (NSInteger)self.length-1; i++) {
        str = [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
    }
    return str;
}

-(NSString *)triming{
    NSString *str = nil;
    str = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    return str;
}

-(BOOL)isChineseCharacterAndLettersAndNumbersAndUnderScore
{
    int len=(int)self.length;
    for(int i=0;i<len;i++)
    {
        unichar a=[self characterAtIndex:i];
        if( !(isalnum(a) || (a=='_')) )
            return NO;
    }
    return YES;
}

@end
