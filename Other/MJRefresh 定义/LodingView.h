//
//  LodingView.h
//  DiningTable
//
//  Created by mac on 2016/12/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LodingView : UIView
- (void)showLoadingTo:(UIView *)view name:(NSString *)imageName CGRect:(CGRect)rect Bool:(BOOL)lab length:(int) length;

- (void)dismiss;

- (void)showLoadViewTo:(UIWindow *)window name:(NSString *)imageName CGRect:(CGRect)rect Bool:(BOOL)lab length:(int) length;
@end
