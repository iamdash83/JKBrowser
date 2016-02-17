//
//  JKFile.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKFile.h"

@interface JKFile ()

@property (nonatomic, strong) NSFileManager *fileManager;

@end

@implementation JKFile

+ (instancetype) fileWithPath:(NSString *)path {
    JKFile *file = [[JKFile alloc] initWithPath:path];
    return file;
}

- (id)initWithPath:(NSString *)path {
    if(self = [super init]) {
        _path = path;
        _fileManager = [[NSFileManager alloc] init];
    }
    return self;
}

- (NSString *)name {
    return _path.lastPathComponent;
}

- (BOOL)exists {
    return [_fileManager fileExistsAtPath:_path];
}

- (BOOL)isDirectory {
    return [[self fileType] isEqualToString:NSFileTypeDirectory];
}

- (BOOL)isHomeDirectory {
    return [NSHomeDirectory() isEqualToString:_path];
}

- (NSArray *)subFilesInDirectory {
    if([self exists] && [self isDirectory]) {
        NSMutableArray *files = [NSMutableArray array];
        NSArray *fileNames = [_fileManager contentsOfDirectoryAtPath:_path error:nil];
        for(NSString *fileName in fileNames) {
            NSString *filePath = [_path stringByAppendingPathComponent:fileName];
            JKFile *file = [JKFile fileWithPath:filePath];
            [files addObject:file];
        }
        return [NSArray arrayWithArray:files];
    }
    else {
        return @[];
    }
}

- (FileFormat)format {
    NSString *ext = _path.pathExtension;
    if([@[] containsObject:ext]) return FileFormat_Text;
    else if([@[] containsObject:ext]) return FileFormat_Text;
    else if([@[] containsObject:ext]) return FileFormat_Text;
    else if([@[] containsObject:ext]) return FileFormat_Text;
    else return FileFormat_Unknow;
}

- (unsigned long long)fileSize {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileSize];
}
- (NSDate *)fileModificationDate {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileModificationDate];
}
- (NSString *)fileType {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileType];
}
- (NSUInteger)filePosixPermissions {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] filePosixPermissions];
}
- (NSString *)fileOwnerAccountName {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileOwnerAccountName];
}
- (NSString *)fileGroupOwnerAccountName {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileGroupOwnerAccountName];
}
- (NSInteger)fileSystemNumber {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileSystemNumber];
}
- (NSUInteger)fileSystemFileNumber {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileSystemFileNumber];
}
- (BOOL)fileExtensionHidden {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileExtensionHidden];
}
- (OSType)fileHFSCreatorCode {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileHFSCreatorCode];
}
- (OSType)fileHFSTypeCode {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileHFSTypeCode];
}
- (BOOL)fileIsImmutable {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileIsImmutable];
}
- (BOOL)fileIsAppendOnly {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileIsAppendOnly];
}
- (NSDate *)fileCreationDate {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileCreationDate];
}
- (NSNumber *)fileOwnerAccountID {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileOwnerAccountID];
}
- (NSNumber *)fileGroupOwnerAccountID {
    return [[_fileManager attributesOfItemAtPath:_path error:nil] fileGroupOwnerAccountID];
}


@end
