//
//  LoginViewControl.m
//  DiningTable
//
//  Created by mac on 2016/12/28.
//  Copyright © 2016年 test. All rights reserved.
//

#import "LoginViewControl.h"
#import "HeaderView.h"
@interface LoginViewControl ()
@property(nonatomic,strong)HeaderView * Header;
@property(nonatomic,strong)LodingView *loding;
@end

@implementation LoginViewControl

-(HeaderView *)Header{
    if (!_Header) {
        _Header=[[HeaderView alloc]init];
        self.Header.backgroundColor=[UIColor grayColor];
    }
    return _Header;
}
-(LodingView *)loding{
    if (!_loding) {
        _loding=[[LodingView alloc]initWithFrame:self.view.frame];
    }
    return _loding;
}
- (void)viewDidLoad {
   [super viewDidLoad];
   [self.view addSubview:self.Header];
   [self setupAutoLayout];
    CGRect rect=CGRectMake(self.Header.centerX, self.Header.centerY, 300, 300);
    [self.loding showLoadingTo:_Header name:@"Logo" CGRect:rect Bool:NO length:6];
    self.view.backgroundColor=[UIColor whiteColor];
    
}
-(void)setupAutoLayout{
    
    CGFloat topViewH = self.view.frame.size.height / 3;
    [_Header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.top.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(topViewH);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  

}

@end
