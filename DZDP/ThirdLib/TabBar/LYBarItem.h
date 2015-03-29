//
//  LYBarItem.h
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYView;
@interface LYBarItem : UIButton

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *heightedImage;
@property (nonatomic, strong) LYView *lyview;

- (void)showHeighted:(BOOL)flag;

@end
