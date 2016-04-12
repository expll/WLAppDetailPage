//
//  WLHeadView.h
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSingleAppIcon.h"
#import "RateView.h"

@interface WLHeadView : UIView
@property (nonatomic, weak) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet WLSingleAppIcon *iconView;
@property (nonatomic, strong) IBOutlet UILabel *nameLable;
@property (nonatomic, strong) IBOutlet RateView *starView;
@property (nonatomic, strong) IBOutlet UILabel *downloadLabel;

@end
