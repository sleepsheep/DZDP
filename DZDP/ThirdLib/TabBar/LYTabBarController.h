//
//  LYTabBarController.h
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kViewController @"viewController"
#define kNormalImage @"Normal"
#define kSelectedImage @"Selected"
#define kTitleName @"titleName"
@interface LYTabBarController : UITabBarController

- (void)setViewControllers:(NSArray *)arr;

@end
