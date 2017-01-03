
//
//  MidView.m
//  DiningTable
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 test. All rights reserved.
//

#import "MidView.h"
@interface MidView ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton * UserName;
@property(nonatomic,strong)UIButton * UserPwd;
@property(nonatomic,strong)UILabel *Nolab;
@end
@implementation MidView

-(instancetype)initWithFrame:(CGRect)frame
{ if(self=[super initWithFrame:frame ]){
    [self addSubview:self.inputName];
    [self addSubview:self.inputPwd];
     [self addSubview:self.UserName];
    [self addSubview:self.UserPwd];
    [self addSubview:self.Loginbtn];
    [self addSubview:self.registerbtn];
    [self addSubview:self.remeberUserpwd];
    [self addSubview:self.forgetUsepwd];
    [self addSubview:self.Nolab];
    [self setupAutoLayout];
   }
    return self;
}
//懒加载
-(UIButton *)UserName{
    if(!_UserName){
        _UserName=[[UIButton alloc]init];
        [_UserName setTitle:@"账号" forState:UIControlStateNormal];
        [_UserName setImage:[UIImage imageNamed:@"Image-1"] forState:UIControlStateNormal];
        _UserName.titleLabel.font=[UIFont systemFontOfSize:18];
        _UserName.titleLabel.textColor=[UIColor colorWithHexString:@"7a7a7a"];
        _UserPwd setTitleColor:[UIColor colorWithHexString:<#(NSString *)#>] forState:<#(UIControlState)#>
    }
    return _UserName;
}
-(UITextField *)inputName{
    if (!_inputName) {
        _inputName =[[UITextField alloc]init];
        _inputName.placeholder=@"请输入手机号";
        _inputName.backgroundColor=[UIColor colorWithHexString:@"#fbfbfb"];
        _inputName.textAlignment=NSTextAlignmentCenter;
        _inputName.layer.borderWidth=1;
        _inputName.layer.borderColor=[UIColor grayColor].CGColor;
        self.inputName.delegate=self;
    }
    return _inputName;
}
-(UITextField *)inputPwd{
    if (!_inputPwd) {
        _inputPwd=[[UITextField alloc]init];
        _inputPwd.placeholder=@"请输入密码";
        _inputPwd.textAlignment=NSTextAlignmentCenter;
        _inputPwd.layer.borderWidth=1;
         _inputPwd.backgroundColor=[UIColor colorWithHexString:@"#fbfbfb"];
        _inputPwd.layer.borderColor=[UIColor grayColor].CGColor;
        self.inputPwd.delegate=self;
    
    }
    return _inputPwd;
}
-(UIButton * )UserPwd{
    if (!_UserPwd) {
        _UserPwd=[[UIButton alloc]init];
        [_UserPwd setTitle:@"密码" forState:UIControlStateNormal];
        [_UserPwd setImage:[UIImage imageNamed:@"Image.png"] forState:UIControlStateNormal];
//        [_UserPwd setTitleColor:[UIColor colorWithHexString:@"ea8c27"] forState:UIControlStateNormal]
        [_UserPwd setTintColor:[UIColor colorWithHexString:@"ea8c27"]];
        _UserPwd.titleLabel.font=[UIFont systemFontOfSize:18];
    }
    return _UserPwd;
    
}
-(UIButton * )Loginbtn{
    if (!_Loginbtn) {
    
        _Loginbtn=[[UIButton alloc]init];
        _Loginbtn.backgroundColor=[UIColor colorWithHexString:@"ea8c27"];
        _Loginbtn.titleLabel.textColor=[UIColor whiteColor];
        [_Loginbtn setTitle:@"登录" forState:UIControlStateNormal];
        _Loginbtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        _Loginbtn.titleLabel.font=[UIFont systemFontOfSize:22];
        _Loginbtn.layer.cornerRadius=8;
    }
    return _Loginbtn;
}
-(UIButton *)remeberUserpwd{
    if (!_remeberUserpwd) {
        _remeberUserpwd=[[UIButton alloc]init];
//        记住密码的图片设置
        [_remeberUserpwd setImage:[UIImage imageNamed:@"Image-2"] forState:UIControlStateNormal];
        [_remeberUserpwd setImage:[UIImage imageNamed: @"Image-3"]forState:UIControlStateSelected];
        [_remeberUserpwd setTitle:@"记住密码" forState:UIControlStateNormal];
    }
    return _remeberUserpwd;
}
-(UIButton *)forgetUsepwd{
    if (!_forgetUsepwd) {
        _forgetUsepwd=[[UIButton alloc]init];
        [_forgetUsepwd setTitle:@"忘记密码？" forState:UIControlStateNormal];
        _forgetUsepwd.titleLabel.font=[UIFont systemFontOfSize:18];
    }
    return _forgetUsepwd;
}
-(UIButton *)registerbtn{
    if (!_registerbtn) {
        _registerbtn=[[UIButton alloc]init];
        [_registerbtn setTitle:@"现在注册" forState:UIControlStateNormal];
        _registerbtn.titleLabel.textColor=[UIColor colorWithHexString:@"ea8c27"];
        _registerbtn.layer.borderColor=[UIColor colorWithHexString:@"ea8c27"].CGColor;
        _registerbtn.layer.borderWidth=1;
    }
    return _registerbtn;
}
-(UILabel *)Nolab{
    if (!_Nolab) {
        _Nolab =[[UILabel alloc]init];
        _Nolab.text=@"还没有账号？";
        _Nolab.textColor=[UIColor colorWithHexString:@"#7a7a7a"];
        _Nolab.font=[UIFont systemFontOfSize:20];
    }
    return _Nolab;
}
//自动布局方法
-(void)setupAutoLayout{
     [_inputName mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top);
         make.centerX.equalTo(self.mas_centerX);
         make.left.equalTo(self.mas_left);
         make.bottom.equalTo(self.inputPwd.mas_top).offset(10);
         make.height.mas_equalTo(55);
     }];
    [_inputPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputName.mas_bottom);
        make.left.equalTo(self.inputName.mas_left);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(self.inputName.mas_height);
        make.bottom.equalTo(self.Loginbtn.mas_top).offset(-30);
    }];
  [_UserName mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.inputName.mas_left).offset(10);
      make.top.and.bottom.equalTo(self.inputName).offset(1);
      make.size.mas_equalTo(CGSizeMake(120, 50));

  }];
    [_UserPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.inputPwd.mas_left).offset(10);
        make.top.and.bottom.equalTo(self.inputPwd).offset(1);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        
    }];
    [_Loginbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputPwd).offset(80);
        make.left.equalTo(self.mas_left).offset(24);
        make.right.equalTo(self.mas_right).offset(-24);
        make.bottom.equalTo(self.mas_bottom).offset(-120);
    }];
    [_registerbtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.Nolab.mas_top);
        make.right.equalTo(self.registerbtn.mas_right).offset(5);
        make.left.equalTo(self.mas_left).offset(100);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    [_Nolab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_bottom).offset(50);
        make.left.equalTo(self.mas_left).offset(70);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.registerbtn.mas_right);
        
    }];
    [_remeberUserpwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.top.equalTo(self.Loginbtn.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-50);
        make.height.mas_equalTo(30);
        
    }];
    [_forgetUsepwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Loginbtn.mas_bottom).offset(5);
        make.right.equalTo(self.mas_right).offset(-12);
        make.bottom.equalTo(self.mas_bottom).offset(-50);
    }];
}
#pragma 代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end

