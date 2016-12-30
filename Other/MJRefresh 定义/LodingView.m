//
//  LodingView.m
//  DiningTable
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "LodingView.h"
@interface LodingView()
///缓冲动画图片数组
@property (nonatomic,strong) NSMutableArray *loadImage;
///播放动画的ImageView
@property (nonatomic,strong) UIImageView *loadImageView;
@end

@implementation LodingView

#pragma mark -
#pragma mark - 懒加载
- (NSMutableArray *)loadImage
{
    if (_loadImage == nil) {
        _loadImage = [[NSMutableArray alloc]init];
    }
    return _loadImage;
}



#pragma makr -
#pragma mark -初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
//视图
- (void)showLoadingTo:(UIView *)view name:(NSString *)imageName CGRect:(CGRect)rect Bool:(BOOL)lab length:(int)length
{
    self.backgroundColor = [UIColor whiteColor];
    //播放加载动画
    [self creatLoadImage:imageName CGMake:rect Bool:lab length:length];
    
    [view addSubview:self];
}
//窗体
- (void)showLoadViewTo:(UIWindow *)window name:(NSString *)imageName CGRect:(CGRect)rect Bool:(BOOL) lab length:(int)length
{
    self.backgroundColor = [UIColor whiteColor];
    //播放加载动画
    [self creatLoadImage:imageName CGMake:rect Bool:lab length:length];
    
    [window addSubview:self];
}

#pragma mark -
#pragma makr - 接口方法
- (void)creatLoadImage:(NSString *)imageName CGMake:(CGRect)rect Bool:(BOOL)lab length:(int) length
{
    if (lab==YES) {
        //创建显示文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x -55,self.center.y,120,120)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"正在加载哦,亲!";
            [self addSubview:label];

    }
      //创建图片动画
    self.loadImageView = [[UIImageView alloc] init];
//    CGRect  rect = CGRectMake(self.center.x - 30,self.center.y - 30,60,60);
    self.loadImageView.frame=rect;
    
    [self addSubview:self.loadImageView];
    
    //加载图片
    if (self.loadImage.count == 0) {
        for (int i = 0; i < length; i++ ) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",imageName,(unsigned long)i]];
            [self.loadImage addObject:image];
        }
    }
    
    //设置动画
    self.loadImageView.animationImages = self.loadImage;
//    设置动画重复次数
    self.loadImageView.animationRepeatCount = 0;
    //持续时间
    self.loadImageView.animationDuration = 2.5;
//    开始动画
    [self.loadImageView startAnimating];
}

///停止动画
- (void)dismiss
{
    self.loadImage = nil;
    self.loadImageView.animationImages = nil;
    [self.loadImageView removeFromSuperview];
    [self removeFromSuperview];
}


@end
