//
//  TableFooterRefresh.m
//  DiningTable
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "TableFooterRefresh.h"

@implementation TableFooterRefresh

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Refresh%ld",(unsigned long)i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    //隐藏状态
    self.refreshingTitleHidden = YES;
    self.stateLabel.hidden = YES;
}




@end
