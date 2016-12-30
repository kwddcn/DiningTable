//
//  nearByViewController.m
//  DiningTable
//
//  Created by mac on 2016/12/20.
//  Copyright © 2016年 test. All rights reserved.
//

#import "nearByViewController.h"
#import "LoginViewControl.h"
@interface nearByViewController ()
@property(nonatomic,strong) UITextField * phoneNumber;
@end

@implementation nearByViewController

-(UITextField *)phoneNumber{
    if (!_phoneNumber) {
        _phoneNumber=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
        self.phoneNumber.layer.borderWidth=1;
        self.phoneNumber.layer.backgroundColor=[UIColor whiteColor].CGColor;
    }
    return _phoneNumber;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor grayColor];
    [self messsageTest];
    }

-(void)messsageTest{
    UIButton * sendbtn=[[UIButton alloc]initWithFrame:CGRectMake(120,120, 180, 120)];
    [sendbtn setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    [sendbtn addTarget:self action:@selector(Send) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendbtn];
    [self.view addSubview:self.phoneNumber];

    

}
-(void)Send{

//    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
//        if (error) {
//            [SVProgressHUD showErrorWithStatus:@"获取验证失败"];
//        }else{
//            [SVProgressHUD showSuccessWithStatus:@"获取成功"];
//        }
//    }];
    
    LoginViewControl * login=[[LoginViewControl alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }



@end
