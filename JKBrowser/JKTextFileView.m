//
//  JKTextFileView.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKTextFileView.h"


@interface JKTextFileView ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation JKTextFileView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _textView = [[UITextView alloc] init];
//    _textView.delegate = self;
    [self addSubview:_textView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textView.frame = self.bounds;
}

- (void)setPath:(NSString *)path {
    _path = path;
    [self reload];
}

- (void)reload {
    _textView.text = [[NSString alloc] initWithContentsOfFile:_path
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    [_textView scrollsToTop];
}




@end
