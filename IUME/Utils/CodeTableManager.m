//
//  CodeTableManager.m
//  PatDog
//
//  Created by yzk on 14-8-29.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "CodeTableManager.h"

@implementation CodeTableManager

+ (NSString *)getValueWithTypeKey:(NSString *)typekey code:(NSString *)code
{
    return [[self class] getValueWithTypeKey:typekey code:code codeTableFile:@"basic_code_table"];
}

+ (NSString *)getValueWithTypeKey:(NSString *)typekey code:(NSString *)code codeTableFile:(NSString *)file
{
    if (code == nil || code.length == 0) {
        return nil;
    }
    NSString *ret = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *valueData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:valueData
                                                         options:0
                                                           error:nil];
    if (dict) {
        id obj = [dict objectForKey:typekey];
        if ([obj isKindOfClass:[NSArray class]]) {
            for (NSDictionary *tmp in obj) {
                if ([[[tmp allKeys] lastObject] isEqualToString:code]) {
                    ret = [tmp objectForKey:code];
                    break;
                }
            }
        }
    }
    return ret;
}

+ (NSString *)getCodeWithTypeKey:(NSString *)typekey value:(NSString *)value
{
    return [[self class] getCodeWithTypeKey:typekey value:value codeTableFile:@"basic_code_table"];
}

+ (NSString *)getCodeWithTypeKey:(NSString *)typekey value:(NSString *)value codeTableFile:(NSString *)file
{
    if (value == nil || value.length == 0) {
        return nil;
    }
    NSString *ret = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *valueData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:valueData
                                                         options:0
                                                           error:nil];
    if (dict) {
        id obj = [dict objectForKey:typekey];
        if ([obj isKindOfClass:[NSArray class]]) {
            for (NSDictionary *tmp in obj) {
                if ([[[tmp allValues] lastObject] isEqualToString:value]) {
                    ret = [[tmp allKeys] lastObject];
                    break;
                }
            }
        }
    }
    return ret;
}

+ (NSArray *)getValueArrayWithTypeKey:(NSString *)typekey
{
    return [[self class] getValueArrayWithTypeKey:typekey codeTableFile:@"basic_code_table"];
}

+ (NSArray *)getValueArrayWithTypeKey:(NSString *)typekey codeTableFile:(NSString *)file
{
    NSMutableArray *retArray = [[NSMutableArray alloc] initWithCapacity:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *valueData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:valueData
                                                         options:0
                                                           error:nil];
    if (dict) {
        id obj = [dict objectForKey:typekey];
        if ([obj isKindOfClass:[NSArray class]]){
            for (NSDictionary *tmp in obj) {
                [retArray addObject:[[tmp allValues] lastObject]];
            }
        }
    }
    return retArray;
}

+ (NSArray *)getCodeArrayWithTypeKey:(NSString *)typekey
{
    return [[self class] getCodeArrayWithTypeKey:typekey codeTableFile:@"basic_code_table"];
}

+ (NSArray *)getCodeArrayWithTypeKey:(NSString *)typekey codeTableFile:(NSString *)file
{
    NSMutableArray *retArray = [[NSMutableArray alloc] initWithCapacity:0];
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *valueData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:valueData
                                                         options:0
                                                           error:nil];
    if (dict) {
        id obj = [dict objectForKey:typekey];
        if ([obj isKindOfClass:[NSArray class]]){
            for (NSDictionary *tmp in obj) {
                [retArray addObject:[[tmp allKeys] lastObject]];
            }
        }
    }
    return retArray;
}

@end
