//
//  bottomView.m
//  DiningTable
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 test. All rights reserved.
//

#import "bottomView.h"

@interface bottomView ()
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UILabel * titlelab;
@end
@implementation bottomView
//懒加载
-(UIButton *)QQlogin{
    if (!_QQlogin) {
        _QQlogin=[[UIButton alloc]init];
        [_QQlogin setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
    }
    return _QQlogin;
}
-(UIButton *)WeBlogin{
    if (!_WeBlogin) {
        _WeBlogin=[[UIButton alloc]init];
        [_WeBlogin setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _WeBlogin;
}
// 预编译方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self addSubview:self.QQlogin];
    }
    return self;
}
@end

