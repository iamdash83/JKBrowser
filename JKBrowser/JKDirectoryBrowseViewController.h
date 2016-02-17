//
//  JKDirectoryBrowseViewController.h
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKDirectoryBrowseViewController : UITableViewController

@property (nonatomic, copy) NSString *path;
- (id)initWithPath:(NSString *)path;

@end
