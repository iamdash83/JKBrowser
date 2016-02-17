//
//  JKFileViewController.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKFileViewController.h"

@interface JKFileViewController ()

@end

@implementation JKFileViewController

- (id)initWithFile:(JKFile *)file {
    if(self = [super init]) {
        _file = file;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = _file.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
