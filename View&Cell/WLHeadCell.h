//
//  WLHeadCell.h
//  AppDetailPage
//
//  Created by DaChui on 4/12/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLHeadView.h"

@interface WLHeadCell : UITableViewCell
@property(nonatomic, assign)IBOutlet WLHeadView *headView;
@property(nonatomic, strong)id data;

@end
