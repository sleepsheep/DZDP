//
//  LYTabBarController.m
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYImageBar.h"
#import "LYBarItem.h"
#import "SystemConst.h"

@interface LYTabBarModel : NSObject

@property (nonatomic, strong) NSString *normalImage;
@property (nonatomic, strong) NSString *selectedImage;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) NSString *titleName;

@end

@implementation LYTabBarModel

@end


@interface LYTabBarController ()
@property (nonatomic, strong) NSMutableArray *muArrModel;
@property (nonatomic, strong) LYImageBar *imagBar;
@property (nonatomic, strong) LYBarItem *curBarItem;
@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _muArrModel = [NSMutableArray array];
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)setViewControllers:(NSArray *)arr {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        NSString *viewController = dic[kViewController];
        NSString *normalImg = dic[kNormalImage];
        NSString *selectedImg = dic[kSelectedImage];
        NSString *titleName = dic[kTitleName];
        
        Class vc =  NSClassFromString(viewController);
        UIViewController *viewC  = [vc new];
        viewC.title = titleName;

        LYTabBarModel *tabP = [LYTabBarModel new];
        tabP.viewController = viewC;
        tabP.normalImage = normalImg;
        tabP.selectedImage = selectedImg;
        tabP.titleName = titleName;
        [_muArrModel addObject:tabP];//自己管理自己的数据
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewC];
        [tempArr addObject:nav];
    }
    
    [super setViewControllers:tempArr];
    
    [self creatTabBar];
}

//创建tabbar
#define BARHEIGHT 49
- (void)creatTabBar {
    self.tabBar.backgroundColor = [UIColor orangeColor];
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    //添加自定义的tabbar
    _imagBar = [[LYImageBar alloc] initWithFrame:CGRectMake(0, height - BARHEIGHT, width, BARHEIGHT)];
    [_imagBar setBackgroundColor:[UIColor whiteColor]];
    _imagBar.image = [UIImage imageNamed:@"drawbg"];
    
    [self.view addSubview:_imagBar];
    
    [self addBarItems];
}

//添加自定义Bar按钮
#define GAPTOLEFT 35
#define GAPTORIGHT 35
#define BARITEMHEIGHT 25
#define BARITEMWIDTH 25
- (void)addBarItems {
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    
    CGFloat gapBetweenTwoItem = (width - GAPTOLEFT - GAPTORIGHT - BARITEMWIDTH * _muArrModel.count)/ (_muArrModel.count - 1);
    
    for (int i =  0; i < _muArrModel.count; i++) {
        //先获取每个item的信息
        LYTabBarModel *tabBar = _muArrModel[i];
        NSString *normalImg = tabBar.normalImage;
        NSString *selectedImg = tabBar.selectedImage;
        NSString *titleName = tabBar.titleName;
        
        //布局每个按钮
        LYBarItem *barItem = [[LYBarItem alloc] init];
    
        [barItem setNormalImage:[UIImage imageNamed:normalImg]];
        [barItem setHeightedImage:[UIImage imageNamed:selectedImg]];
        [barItem setTitle:titleName forState:UIControlStateNormal];
        [barItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [barItem setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        barItem.titleLabel.font = [UIFont systemFontOfSize:10];
        barItem.titleEdgeInsets = UIEdgeInsetsMake(40, 0, 0, 0);
        [barItem addTarget:self action:@selector(item_Clicked:) forControlEvents:UIControlEventTouchUpInside];//设置按钮按下的事件
//        barItem.backgroundColor = [UIColor orangeColor];
        
        barItem.tag = i + 100;
        barItem.frame = CGRectMake(GAPTOLEFT + i * (BARITEMWIDTH + gapBetweenTwoItem), height - BARITEMHEIGHT - 20, BARITEMWIDTH, BARITEMHEIGHT);
        if (i == 0) {
            [self item_Clicked:barItem];
        }
        
        [self.view addSubview:barItem];
    }
}

- (void)item_Clicked:(LYBarItem *)barItem {
    NSInteger index = barItem.tag - 100;
    barItem.selected = YES;
    [barItem showHeighted:YES];
    self.selectedIndex = index;

    if (barItem != _curBarItem) {
        _curBarItem.selected = NO;
        [_curBarItem showHeighted:NO];
    }
    _curBarItem = barItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
