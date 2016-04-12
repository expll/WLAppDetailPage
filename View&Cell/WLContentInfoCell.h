//
//  WLContentInfoCell.h
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLContentInfoCell : UITableViewCell
@property(nonatomic, assign)IBOutlet UILabel *titleLabel;
@property(nonatomic, assign)IBOutlet UILabel *contentLabel;
@property(nonatomic, strong)NSDictionary *dataDic;

@end
