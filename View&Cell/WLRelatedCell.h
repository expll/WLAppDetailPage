//
//  WLRelatedCell.h
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLRelatedView.h"

@interface WLRelatedCell : UITableViewCell
@property(nonatomic, weak)IBOutlet WLRelatedView *relatedView;
@property(nonatomic, strong)id data;

@end
