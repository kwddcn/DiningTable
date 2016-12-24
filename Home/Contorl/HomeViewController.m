//
//  HomeViewController.m
//  DiningTable
//
//  Created by mac on 2016/12/20.
//  Copyright © 2016年 test. All rights reserved.
//

#import "HomeViewController.h"
#import "TableHeaderRefresh.h"
#import "TableFooterRefresh.h"
#import "LodingView.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)LodingView * loding;
@property(nonatomic,strong)UITableView * table;
@end

@implementation HomeViewController
//
-(UITableView *)table{
    if (!_table) {
        _table=[[UITableView alloc]initWithFrame:self.view.frame];
        _table.delegate=self;
        _table.dataSource=self;
        _table.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    }
    return _table;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.loding=[[LodingView alloc]initWithFrame:self.view.frame];
//    [self.loding showLoadingTo:self.view];
    self.view.backgroundColor=[UIColor purpleColor];
    self.table.mj_header=[TableHeaderRefresh headerWithRefreshingTarget:self refreshingAction:@selector(LodingNewData)];
    self.table.mj_footer=[TableFooterRefresh footerWithRefreshingTarget:self refreshingAction:@selector(LodingOtherData)];
    [self.view addSubview:_table];

  
}
-(void)LodingNewData{
    NSLog(@"这是上拉加载");
}
-(void)LodingOtherData{
    NSLog(@"这是下拉刷新");
}
#pragma 代理方法的实现
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cc"];
    if (!cell) {
        cell=[[UITableViewCell alloc]init];
    }
    return cell;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
