//
//  JKFileCell.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKFileCell.h"

@interface JKFileCell ()

@property (nonatomic, strong) UIImageView *fileType;
@property (nonatomic, strong) UILabel *fileName;

@end

@implementation JKFileCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _fileType = [UIImageView new];
        _fileName = [[UILabel alloc] init];
        _fileName.font = [UIFont systemFontOfSize:15];
        _fileName.textColor = [UIColor blackColor];
        _fileName.textAlignment = NSTextAlignmentLeft;
        _fileName.numberOfLines = 0;
        _fileName.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:_fileType];
        [self.contentView addSubview:_fileName];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _fileType.frame = CGRectMake(10, (self.frame.size.height - 32)/2.0f, 32, 32);
    _fileName.frame = CGRectMake(_fileType.frame.origin.x + _fileType.frame.size.width + 5, 5, self.frame.size.width - (_fileType.frame.origin.x + _fileType.frame.size.width + 5) - 30, self.frame.size.height - 2*5);
}

- (void)setFile:(JKFile *)file {
    if(![_file isEqual:file]) {
        _file = file;
        [self refreshView];
    }
}

- (void)refreshView {
    
   _fileName.text = _file.name;
    if(_file.isDirectory) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UIImage *image = nil;
    if(_file.isDirectory) {
        image = [UIImage imageNamed:@"folder"];
    }
    else {
        NSString *ext = _file.path.pathExtension;
        if(ext) {
            image = [UIImage imageNamed:ext];
        }
        if(!image) {
            image = [UIImage imageNamed:@"unknow_file"];
        }
    }
    _fileType.image = image;
}

@end
