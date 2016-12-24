//
//  TableHeaderRefresh.m
//  DiningTable
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "TableHeaderRefresh.h"

@implementation TableHeaderRefresh

- (void)prepare
{
    [super prepare];
    
    //舍子普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    //下啦的图片。。
    UIImage *imageBegin = [UIImage imageNamed:@"pullRefresh"];
    [idleImages addObject:imageBegin];
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    
    //设置即将刷新的图片
    NSMutableArray *pullImages = [NSMutableArray array];
//    放手的图片
    UIImage *imagePull = [UIImage imageNamed:@"loading"];
    [pullImages addObject:imagePull];
    [self setImages:pullImages forState:MJRefreshStatePulling];
    
    //设置正在刷新状态的动画图片
    NSMutableArray *refreshImages = [NSMutableArray array];
//    循环传入自己的图片注意命名和图片数量
    for (NSUInteger i = 0; i < 10; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Refresh%ld",(unsigned long)i]];
        NSLog(@"%lu",(unsigned long)i);
        [refreshImages addObject:image];
    }
    
    /**
     * 普通闲置状态
     MJRefreshStateIdle = 1,
     * 松开就可以进行刷新的状态
     MJRefreshStatePulling,
     * 正在刷新中的状态
     MJRefreshStateRefreshing,
     * 即将刷新的状态
     MJRefreshStateWillRefresh,
     * 所有数据加载完毕，没有更多的数据了
     MJRefreshStateNoMoreData
     **/
//    设置图片和刷新状态
    [self setImages:refreshImages forState:MJRefreshStateRefreshing];
    
    //隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    
    //隐藏状态
    self.stateLabel.hidden = YES;
    
    //设置高度
    self.mj_h = 60;
}

@end
