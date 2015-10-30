//
//  CategorySysClass.m
//  xiwu
//
//  Created by yzk on 14-7-21.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "CategorySysClass.h"

@implementation CategorySysClass

@end


@implementation NSObject (Extend)

- (NSString*)analysisConvertToString{
    if ([self isKindOfClass:[NSNull class]] || !self) {
        return @"";
    }else if([self isKindOfClass:[NSNumber class]]){
        return [NSString stringWithFormat:@"%@", self];
    }else{
        return (NSString*)self;
    }
}

- (NSMutableDictionary*)analysisConvertToDict{
    if ([self isKindOfClass:[NSNull class]]) {
        return [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
    }else if([self isKindOfClass:[NSDictionary class]]){
        return (NSMutableDictionary*)self;
    }else{//对服务器字典类型，返回空串的容错
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
        [dict setObject:self forKey:@""];
        return dict;
    }
}

- (NSMutableArray*)analysisConvertToArray{
    if ([self isKindOfClass:[NSNull class]]) {
        return [NSMutableArray arrayWithObjects: nil];
    }else if([self isKindOfClass:[NSMutableArray class]]){
        return (NSMutableArray*)self;
    }else if ([self isKindOfClass:[NSArray class]]){
        return [NSMutableArray arrayWithArray:(NSArray*)self];
    }else{
        return [NSMutableArray arrayWithObjects:self, nil];
    }
}


@end
