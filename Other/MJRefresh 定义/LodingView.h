//
//  LodingView.h
//  DiningTable
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LodingView : UIView
- (void)showLoadingTo:(UIView *)view;

- (void)dismiss;

- (void)showLoadViewTo:(UIWindow *)window;
@end
