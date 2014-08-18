//
//  NewsViewController.m
//  Demo
//
//  Created by SYAN on 14-8-18.
//  Copyright (c) 2014年 SYAN. All rights reserved.
//

#import "NewsViewController.h"
#import "DownLoadManager.h"
#import "NewsMode.h"
#import "NewsCell.h"
#import "UIImageView+WebCache.h"
#define NEWS @"http://sqt.9tong.com/sqt/industry/loadTopAticles.do?SC=11&inid=1"


@interface NewsViewController ()

@end

@implementation NewsViewController
{
    DownLoadManager *_downLoadManager;
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self layoutView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:NEWS object:nil];
    _downLoadManager = [DownLoadManager sharedDownLoadManager];
    [_downLoadManager addDownLoadWithURLString:NEWS andType:NEWSTYPE];
}

- (void)downLoadFinish{
    _dataArray = [[NSMutableArray alloc] init];
    _dataArray = [_downLoadManager getDownLoadDataWithURLString:NEWS];
    [_tableView reloadData];
}

- (void)layoutView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568 - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.title = ((NewsMode *)_dataArray[indexPath.row]).title;
    NSLog(@"%@",((NewsMode *)_dataArray[indexPath.row]).title);
    cell.description = ((NewsMode *)_dataArray[indexPath.row]).description;
    [cell.image setImageWithURL:[NSURL URLWithString:((NewsMode *)_dataArray[indexPath.row]).imageURL]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
