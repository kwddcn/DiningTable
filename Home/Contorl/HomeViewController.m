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
@property(nonatomic,strong)NSArray * array1;
@property(nonatomic,strong)NSArray * array2;
@property(nonatomic,strong)NSMutableArray * temp;
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
-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
    self.table.mj_header=[TableHeaderRefresh headerWithRefreshingTarget:self refreshingAction:@selector(LodingNewData)];
    self.table.mj_footer=[TableFooterRefresh footerWithRefreshingTarget:self refreshingAction:@selector(LodingOtherData)];
    [self.view addSubview:_table];
    //等待页面
    self.loding=[[LodingView alloc]initWithFrame:self.view.frame];
    CGRect  rect = CGRectMake(self.table.center.x - 30,self.table.center.y - 30,60,60);
    [self.loding showLoadingTo:self.table name:@"Refresh" CGRect:rect Bool:YES length:10];
//    加载完成后隐藏加载动画
//    [self.loding dismiss];
}
-(void)LodingNewData{
    [self.table.mj_header endRefreshing];


}
-(void)LodingOtherData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.table.mj_footer endRefreshing];
    });

}
#pragma 代理方法的实现
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cc"];
    if (!cell) {
        cell=[[UITableViewCell alloc]init];
    }
    cell.textLabel.text=self.temp[indexPath.row];
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _temp.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
