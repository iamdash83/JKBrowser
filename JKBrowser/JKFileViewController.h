//
//  JKFileViewController.h
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKFile.h"

@interface JKFileViewController : UIViewController

@property (nonatomic, strong) JKFile *file;

- (id)initWithFile:(JKFile *)file;

@end
