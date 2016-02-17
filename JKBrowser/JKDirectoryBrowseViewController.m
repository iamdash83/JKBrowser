//
//  JKDirectoryBrowseViewController.m
//  JKBrowser
//
//  Created by renjinkui on 16/2/17.
//  Copyright © 2016年 renjinkui. All rights reserved.
//

#import "JKDirectoryBrowseViewController.h"
#import "JKFile.h"
#import "JKFileCell.h"

@interface JKDirectoryBrowseViewController ()

@property (nonatomic, strong) JKFile *file;
@property (nonatomic, strong) NSMutableArray *subFiles;

@end

@implementation JKDirectoryBrowseViewController


- (id)initWithPath:(NSString *)path {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        _path = path;
        _file = [JKFile fileWithPath:_path];
        _subFiles = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

- (void)setPath:(NSString *)path {
    if(![_path isEqualToString:path]) {
        _path = path;
        _file = [JKFile fileWithPath:_path];
        [self reload];
    }
}

- (void)reload {
    [_subFiles removeAllObjects];
    [_subFiles setArray:_file.subFilesInDirectory];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[JKFileCell class] forCellReuseIdentifier:NSStringFromClass([JKFileCell class])];
    self.tableView.tableFooterView = [UIView new];
    [self reload];
    
    if(_file.isHomeDirectory) {
        self.navigationItem.title = @"~";
    }
    else {
        self.navigationItem.title = _file.name;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openFile:(JKFile *)file {
    if(file.isDirectory) {
        JKDirectoryBrowseViewController *browser = [[JKDirectoryBrowseViewController alloc] initWithPath:file.path];
        [self.navigationController pushViewController:browser animated:YES];
    }
    else {
       
    }
}

- (void)deleteFile:(JKFile *)file {
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    JKFile *file = _subFiles[indexPath.row];
    ((JKFileCell *)cell).file = file;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JKFile *file = _subFiles[indexPath.row];
    [self openFile:file];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _subFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKFileCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JKFileCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
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
