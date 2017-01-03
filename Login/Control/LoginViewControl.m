//
//  LoginViewControl.m
//  DiningTable
//
//  Created by mac on 2016/12/28.
//  Copyright © 2016年 test. All rights reserved.
//

#import "LoginViewControl.h"
#import "HeaderView.h"
#import "MidView.h"
#import "bottomView.h"
@interface LoginViewControl ()
@property(nonatomic,strong)HeaderView * Header;
@property(nonatomic,strong)LodingView *loding;
@property(nonatomic,strong)MidView * midView;
@property(nonatomic,strong)bottomView * bottomView;
@end

@implementation LoginViewControl

//懒加载
-(HeaderView *)Header{
    if (!_Header) {
        _Header=[[HeaderView alloc]init];
        
           [self.view addSubview:self.Header];
    }
    return _Header;
}
-(LodingView *)loding{
    if (!_loding) {
        _loding=[[LodingView alloc]init];
    }
    return _loding;
}

-(MidView *)midView{
    if (!_midView) {
        _midView =[[MidView alloc]init];
    }
    return _midView;
}

-(bottomView *)bottomView{
    if (!_bottomView) {
        _bottomView=[[bottomView alloc]init];
    }
    return _bottomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithHexString:@"e0e0e0"];
    [self.view addSubview:self.Header];
    [self.view addSubview:self.midView];
    [self.view addSubview:self.bottomView];
    self.midView.backgroundColor=[UIColor grayColor];
    //    self.Header.backgroundColor=[UIColor redColor];
//    self.bottomView.backgroundColor=[UIColor redColor];
    [self setupAutoLayout];
    self.title=@"登录";
    //首页动画
    CGRect rect=CGRectMake(self.Header.centerX+30, self.Header.centerY-20, 300, 300);
    [self.loding showLoadingTo:self.Header name:@"Logo" CGRect:rect Bool:NO length:6];
//    键盘监听事件
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backFrame) name:UIKeyboardWillShowNotification object:nil];
    
}

/**
 *  页面被销毁时，移除通知
 */
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


// 页面上移动
-(void)changeFrame{
    
     self.view.transform = CGAffineTransformMakeTranslation(0, -100);
}
//页面恢复
-(void)backFrame{
    
  self.view.transform = CGAffineTransformIdentity;

}
-(void)setupAutoLayout{
    
    CGFloat topViewH = self.view.frame.size.height / 3;
    [_Header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.top.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(topViewH-30);
    }];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.Header.mas_bottom);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.height.mas_equalTo(topViewH+50);
        
    }];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.midView.mas_bottom).offset(1);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  

}

@end
