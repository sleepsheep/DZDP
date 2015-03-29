//
//  LYBarItem.m
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "LYBarItem.h"
#import "LYView.h"

@implementation LYBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lyview = [[LYView alloc] init];
        _lyview.hidden = YES;
        [self addSubview:_lyview];
    }
    return self;
}

- (void)setNormalImage:(UIImage *)normalImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
}

- (void)setHeightedImage:(UIImage *)heightedImage {
    [self setBackgroundImage:heightedImage forState:UIControlStateSelected];
}

//重写selected方法
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self showHeighted:selected];
}

- (void)showHeighted:(BOOL)selected {
    if (selected) {
        _lyview.hidden = NO;
    } else {
        _lyview.hidden = YES;
    }
}

//- (void)setTitleName:(NSString *)titleName {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - 20, self.frame.size.width, 20)];
//    label.backgroundColor = [UIColor blackColor];
//    [self addSubview:label];
//}


@end
