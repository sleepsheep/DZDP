//
//  LYView.m
//  TabbarDemo
//
//  Created by yangL on 15/3/18.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "LYView.h"

#define WIDTH 375/4 //根据tabbarItem的个数需要调整成相应的值
@implementation LYView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 3)];
        view.backgroundColor = [UIColor clearColor];
        [self addSubview:view];
    }
    return self;
}


@end
