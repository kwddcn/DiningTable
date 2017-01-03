//
//  BaseNavigationController.m
//  DiningTable
//
//  Created by mac on 2016/12/20.
//  Copyright © 2016年 test. All rights reserved.
//

#import "BaseNavigationController.h"
#import "LoginViewControl.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginViewControl * login=[[LoginViewControl alloc]init];
    BaseNavigationController *Navigation=[[BaseNavigationController alloc]init];
    [Navigation addChildViewController:login];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


@end
