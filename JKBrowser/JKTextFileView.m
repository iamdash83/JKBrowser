//
//  JKTextFileView.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKTextFileView.h"
#import "JKFlatMenuBar.h"

@interface JKTextFileView ()<JKFlatMenuBarDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) JKFlatMenuBar *menuBar;

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
    
    JKFlatMenuBar *bar = [[JKFlatMenuBar alloc] initWithFrame:CGRectMake(0, 64, 60, 50) menus:@[@(MenuId_GoLine),@(MenuId_SearchText),@(MenuId_ScrollLine_Backward),@(MenuId_ScrollLine_Forward),@(MenuId_ScrollPage_Backward),@(MenuId_ScrollPage_Forward),@(MenuId_ScrollToTop),@(MenuId_ScrollToBottom)]];
    bar.delegate = self;
    [self addSubview:bar];
    _menuBar = bar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textView.frame = self.bounds;
//    _menuBar.frame = CGRectMake(self.frame.size.width - _menuBar.frame.size.width - 10, self.frame.size.height - _menuBar.frame.size.height - 10, _menuBar.frame.size.width, _menuBar.frame.size.height);
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
