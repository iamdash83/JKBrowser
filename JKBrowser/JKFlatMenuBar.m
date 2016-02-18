//
//  JKFlatMenuBar.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/18.
//  Copyright © 2016年 renjinkui. All rights reserved.
#import "JKFlatMenuBar.h"

#define MIN_WIDTH 60
#define MIN_HEIGHT 40
#define MAX_MENU_LIST_HEIGHT 120

@interface MenuCell : UITableViewCell

@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, assign) MenuId menuId;

@end

@implementation MenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_menuButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _menuButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_menuButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _menuButton.frame = self.contentView.bounds;
}

- (void)setMenuId:(MenuId)menuId {
    _menuId = menuId;
    [self refreshView];
}

- (void)refreshView {
    [_menuButton setTitle:MENU_TITLE_MAP[@(_menuId)] forState:UIControlStateNormal];
}


@end

@interface JKFlatMenuBar ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton *expandButton;
@property (nonatomic, strong) UITableView *menusTableView;
@property (nonatomic, assign) BOOL expand;

@end

@implementation JKFlatMenuBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame menus:(NSArray *)menus {
    frame = CGRectMake(frame.origin.x, frame.origin.y, MIN(frame.size.width, MIN_WIDTH), MIN(frame.size.height, MIN_HEIGHT));
    if(self = [super initWithFrame:frame]) {
        _menus = menus.copy;
        _expandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_expandButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_expandButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _expandButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_expandButton addTarget:self action:@selector(onExpandButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_expandButton];
        [self refreshExpandButton];
        
        _menusTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _menusTableView.delegate = self;
        _menusTableView.dataSource = self;
        _menusTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_menusTableView];
        
        [_menusTableView registerClass:[MenuCell class] forCellReuseIdentifier:NSStringFromClass(MenuCell.class)];
        
        [_menusTableView reloadData];
        
        self.backgroundColor = [UIColor greenColor];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:pan];
    }
    return self;
}


- (void)refreshExpandButton {
    //[_expandButton setTitle:_expand?@"收起":@"展开" forState:UIControlStateNormal];
    [_expandButton setImage:[UIImage imageNamed:_expand?@"arrow_down":@"arrow_up"] forState:UIControlStateNormal];
}



- (void)handlePan:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:self.superview];
    self.frame = CGRectMake(self.frame.origin.x + translation.x, self.frame.origin.y + translation.y, self.frame.size.width, self.frame.size.height);
    [pan setTranslation:CGPointZero inView:self.superview];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(_expand) {
        _menusTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - MIN_HEIGHT);
        _expandButton.frame = CGRectMake(0, self.frame.size.height - MIN_HEIGHT, self.frame.size.width, MIN_HEIGHT);
    }
    else {
        _menusTableView.frame = CGRectZero;
        _expandButton.frame = self.bounds;
    }
}

- (void)onExpandButtonPressed:(UIButton *)button {
    _expand = !_expand;
    if(_expand) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - MAX_MENU_LIST_HEIGHT, self.frame.size.width, self.frame.size.height + MAX_MENU_LIST_HEIGHT);
    }
    else {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + MAX_MENU_LIST_HEIGHT, self.frame.size.width, MIN_HEIGHT);
    }
    [self setNeedsLayout];
    [self refreshExpandButton];
}


- (void)onMenuButtonPressed:(UIButton *)button {
    if([_delegate respondsToSelector:@selector(flatMenuBar:didSelectMenuId:)]) {
        [_delegate flatMenuBar:self didSelectMenuId:button.tag];
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuId menuId = [_menus[indexPath.row] integerValue];
    ((MenuCell *)cell).menuId = menuId;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([_delegate respondsToSelector:@selector(flatMenuBar:didSelectMenuId:)]) {
        [_delegate flatMenuBar:self didSelectMenuId:[_menus[indexPath.row] integerValue]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MenuCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.menuButton.tag = [_menus[indexPath.row] integerValue];
    [cell.menuButton removeTarget:self action:@selector(onMenuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.menuButton addTarget:self action:@selector(onMenuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}



@end
