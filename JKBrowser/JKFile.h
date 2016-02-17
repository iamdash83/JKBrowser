//
//  JKFile.h
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FileFormat) {
    FileFormat_Unknow = -1,
    FileFormat_Text,
    FileFormat_SourceCode,
    FileFormat_Video,
    FileFormat_Audio,
    FileFormat_Image,
    FileFormat_Database
};

@interface JKFile : NSObject

@property (nonatomic, copy) NSString *path;

+ (instancetype) fileWithPath:(NSString *)path;
- (id)initWithPath:(NSString *)path;
- (NSString *)name;
- (BOOL)exists;
- (BOOL)isDirectory;
- (BOOL)isHomeDirectory;
- (NSArray *)subFilesInDirectory;
- (FileFormat)format;

- (unsigned long long)fileSize;
- (NSDate *)fileModificationDate;
- (NSString *)fileType;
- (NSUInteger)filePosixPermissions;
- (NSString *)fileOwnerAccountName;
- (NSString *)fileGroupOwnerAccountName;
- (NSInteger)fileSystemNumber;
- (NSUInteger)fileSystemFileNumber;
- (BOOL)fileExtensionHidden;
- (OSType)fileHFSCreatorCode;
- (OSType)fileHFSTypeCode;
- (BOOL)fileIsImmutable;
- (BOOL)fileIsAppendOnly;
- (NSDate *)fileCreationDate;
- (NSNumber *)fileOwnerAccountID;
- (NSNumber *)fileGroupOwnerAccountID;

@end
