//
//  UMResumeMD.h
//  IUME
//
//  Created by 珍 on 15/10/31.
//  Copyright © 2015年 UME. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResumeData;
@interface UMResumeMD : NSObject

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<ResumeData *> *data;

@property (nonatomic, copy) NSString *type;

@end
@interface ResumeData : NSObject
/**
 *  工作年限
 */
@property (nonatomic, copy) NSString *gznx;

/**
 *
 */
@property (nonatomic, copy) NSString *gxbq1;

@property (nonatomic, copy) NSString *spare20;

@property (nonatomic, copy) NSString *spare9;

@property (nonatomic, copy) NSString *spare15;

/**
 *  下载地址
 */
@property (nonatomic, copy) NSString *xzdz;

@property (nonatomic, copy) NSString *qwgz;

@property (nonatomic, copy) NSString *spare4;

@property (nonatomic, copy) NSString *spare16;

@property (nonatomic, copy) NSString *spare6;

@property (nonatomic, copy) NSString *spare10;

@property (nonatomic, copy) NSString *spare17;

@property (nonatomic, copy) NSString *spare1;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *spare8;

@property (nonatomic, copy) NSString *spare11;

@property (nonatomic, assign) NSInteger spare18;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *spare3;

@property (nonatomic, copy) NSString *gxbq3;
/**
 *  学历
 */
@property (nonatomic, copy) NSString *xl;
/**
 *  电话号码
 */
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, copy) NSString *spare12;
/**
 *  上传时间
 */
@property (nonatomic, copy) NSString *spare5;

@property (nonatomic, copy) NSString *spare19;

@property (nonatomic, copy) NSString *hy;

@property (nonatomic, copy) NSString *spare13;

@property (nonatomic, copy) NSString *gxbq2;

@property (nonatomic, copy) NSString *spare7;

@property (nonatomic, copy) NSString *emaill;

@property (nonatomic, copy) NSString *spare14;

@property (nonatomic, copy) NSString *spare2;

@end

