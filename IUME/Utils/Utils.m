//
//  Utils.m
//  xiwu
//
//  Created by yzk on 14-7-24.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "Utils.h"
#import "SSKeychain.h"
#import "sys/utsname.h"

@implementation Utils

+ (NSString *)equipment{
    
    NSString *udid = [SSKeychain passwordForService:@"cn.cooperlink.RongChuang" account:@"deviceid"];
    if( udid == 0){
        NSString *uuidStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        [SSKeychain setPassword: [NSString stringWithFormat:@"%@", uuidStr]
                     forService:@"cn.cooperlink.RongChuang"
                        account:@"deviceid"];
        udid=[NSString stringWithFormat:@"%@", uuidStr];
    }
    return udid;
}

+ (NSString *)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

#pragma mark - dataString

+ (NSString *)dataByteString:(NSData *)data
{
    NSMutableString* output = [NSMutableString string];
    for(int i = 0; i < data.length; i++)
        [output appendFormat:@"%02x", ((unsigned char *)[data bytes])[i]];
    return output;
}

#pragma mark - cache

+ (NSString *)getCachePath
{
    NSString * path = [NSString stringWithFormat:@"%@/Library/Caches",NSHomeDirectory()];
//    NSLog(@"Library Path: %@",path);
    return path;
}

+ (void)saveFile:(NSString *)dir name:(NSString *)name data:(NSData *)data
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *dirPath = [[self getCachePath] stringByAppendingPathComponent:dir];
    BOOL isDir = NO;
    BOOL exists = [fm fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( !exists || !isDir) {
        NSError *error = nil;
        [fm createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(error) {
            NSLog(@"create dir error:%@",error);
        }
    }
    NSString *path = [dirPath stringByAppendingPathComponent:name];
    BOOL ret = [data writeToFile:path atomically:YES];
    NSLog(@"write file %i, path:%@",ret,path);
}

+ (NSData *)readFile:(NSString *)dir name:(NSString *)name
{
    NSString *path = [[[self getCachePath] stringByAppendingPathComponent:dir] stringByAppendingPathComponent:name];
//    NSLog(@"read file path:%@",path);
    return [NSData dataWithContentsOfFile:path];
}

+ (NSString*)cacheModuleVersionDirectoryName {
    
    static NSString *cacheDirectoryName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = paths[0];
        cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"moduleVersion"];
        NSLog(@"\ncacheDirectoryName:%@",cacheDirectoryName);
    });
    
    return cacheDirectoryName;
}

+ (void)saveModuleVersion:(NSDictionary *)dict forKey:(NSString*)moduleVersionKey
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (![[NSFileManager defaultManager] fileExistsAtPath:[self cacheModuleVersionDirectoryName]]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[self cacheModuleVersionDirectoryName] withIntermediateDirectories:YES attributes:nil error:NULL];
        }
                
        NSString *filePath = [[self cacheModuleVersionDirectoryName] stringByAppendingPathComponent:[moduleVersionKey md5]];
        if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
        [dict writeToFile:filePath atomically:YES];
    });
}

+ (NSDictionary *)readModuleVersionWithKey:(NSString *)moduleVersionKey
{
    NSString *filePath = [[self cacheModuleVersionDirectoryName] stringByAppendingPathComponent:[moduleVersionKey md5]];
    return [[NSDictionary alloc] initWithContentsOfFile:filePath];
}

+ (void)clearModuleVersion
{
    NSString *filePath = [self cacheModuleVersionDirectoryName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    [[NSFileManager defaultManager] createDirectoryAtPath:filePath
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:NULL];
}

#pragma mark - document

+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (BOOL)saveToDocumentWithFileName:(NSString *)fileName dict:(NSDictionary *)dict
{
    NSString *filePath = [[self getDocumentPath] stringByAppendingPathComponent:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath isDirectory:nil]) {
        [fm removeItemAtPath:filePath error:nil];
    }
    return [dict writeToFile:filePath atomically:YES];
}

+ (NSDictionary *)readFromDocumentWithFileName:(NSString *)fileName
{
    NSString *filePath = [[self getDocumentPath] stringByAppendingPathComponent:fileName];
    return [[NSDictionary alloc] initWithContentsOfFile:filePath];
}

+ (BOOL)deleteFromDocumentWithFileName:(NSString *)fileName
{
    NSString *filePath = [[self getDocumentPath] stringByAppendingPathComponent:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:filePath isDirectory:nil]) {
        return [fm removeItemAtPath:filePath error:nil];
    }
    return YES;
}

#pragma mark - NSUserDefault

+ (void)UDsetObject:(id)value key:(NSString *)key{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df setObject:value forKey:key];
    [df synchronize];
}
+ (void)UDremoveObjectForKey:(NSString *)key
{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    [df removeObjectForKey:key];
    [df synchronize];
}

+ (id)UDgetObjectForKey:(id)key{
    NSUserDefaults *df = [NSUserDefaults standardUserDefaults];
    return [df objectForKey:key];
}


#pragma mark - verifyIdentity

+ (BOOL)verifyIdentity:(NSString*)idcard
{
    if( idcard == nil){
        return NO;
    }
    idcard = idcard.uppercaseString;
    if (idcard.length == 15) {
        return YES;
    }else if (idcard.length != 18) {
        return NO;
    }
    NSString *verify = [idcard substringFromIndex:17];
    if (![verify isEqualToString:[Utils getVerify:idcard]]) {
        return NO;
    }
    NSString * regex  = @"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}((19\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|(19\\d{2}(0[13578]|1[02])31)|(19\\d{2}02(0[1-9]|1\\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\\d{3}(\\d|X|x)?$";
    NSPredicate * pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if( ![pred evaluateWithObject:idcard] ){
        return false;
    }
    return true;
}

static int wi[] = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 };
static int vi[] = { 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 };
+ (NSString *)getVerify:(NSString *)eightcardid
{
    int remaining = 0;
    int ai[18];
    if (eightcardid.length == 18) {
        NSRange range;
        range.location = 0;
        range.length = 17;
        eightcardid = [eightcardid substringWithRange:range];
    }
    if (eightcardid.length == 17) {
        int sum = 0;
        for (int i = 0; i < 17; i++) {
            //				String k = eightcardid.substring(i, i + 1);
            char k = [eightcardid characterAtIndex:i];
            ai[i] = (int)(k - '0');
        }
        for (int i = 0; i < 17; i++) {
            sum = sum + wi[i] * ai[i];
        }
        remaining = sum % 11;
    }
    return remaining == 2 ? @"X" : [NSString stringWithFormat:@"%d",vi[remaining]];
}

+ (BOOL)verifyMobile:(NSString *)mobile
{
    NSString *express = @"^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9])[0-9]{8}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF matches %@", express];
    return [pred evaluateWithObject:mobile];
}

+ (BOOL)verifyEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


@end
