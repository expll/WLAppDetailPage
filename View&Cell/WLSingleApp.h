//
//  WLSingleApp.h
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLSingleAppIcon.h"

@interface WLSingleApp : UIView
@property (nonatomic, weak) IBOutlet UIView *view;
@property (nonatomic, weak) IBOutlet UILabel *nameLable;
@property (nonatomic, weak) IBOutlet UIButton *downBtn;
@property (nonatomic, weak) IBOutlet WLSingleAppIcon *iconView;
@property (nonatomic, strong)id data;

@end
