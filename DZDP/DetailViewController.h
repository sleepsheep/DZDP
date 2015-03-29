//
//  DetailViewController.h
//  DZDP
//
//  Created by yangL on 15/3/29.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

