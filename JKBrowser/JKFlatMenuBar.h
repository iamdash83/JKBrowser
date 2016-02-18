//
//  JKFlatMenuBar.h
//  JKBrowser
//
//  Created by renjinkui on 16/2/18.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MenuId) {
    MenuId_GoLine,
    MenuId_SearchText,
    MenuId_ScrollLine_Forward,
    MenuId_ScrollLine_Backward,
    MenuId_ScrollPage_Forward,
    MenuId_ScrollPage_Backward,
    MenuId_ScrollToTop,
    MenuId_ScrollToBottom,
    MenuId_Save,
    MenuId_Undo,
    MenuId_Redo
};

#define  MENU_TITLE_MAP @{\
@(MenuId_GoLine):@"跳转行",\
@(MenuId_SearchText):@"搜索文本",\
@(MenuId_ScrollLine_Forward):@"下翻一行",\
@(MenuId_ScrollLine_Backward):@"上翻一行",\
@(MenuId_ScrollPage_Forward):@"下翻一页",\
@(MenuId_ScrollPage_Backward):@"上翻一页",\
@(MenuId_ScrollToTop):@"到顶",\
@(MenuId_ScrollToBottom):@"到底",\
@(MenuId_Save):@"保存",\
@(MenuId_Undo):@"撤销",\
@(MenuId_Redo):@"重做"\
}

@class JKFlatMenuBar;

@protocol  JKFlatMenuBarDelegate <NSObject>

- (void)flatMenuBar:(JKFlatMenuBar *)menuBar didSelectMenuId:(MenuId)menuId;

@end

@interface JKFlatMenuBar : UIView

@property (nonatomic, strong) NSArray *menus;
@property (nonatomic, weak) id<JKFlatMenuBarDelegate>delegate;

- (id)initWithFrame:(CGRect)frame menus:(NSArray *)menus;

@end
