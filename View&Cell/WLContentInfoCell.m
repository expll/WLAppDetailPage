//
//  WLContentInfoCell.m
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLContentInfoCell.h"

@implementation WLContentInfoCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark- Setter/Getter
- (void)setDataDic:(NSDictionary *)dataDic{
    if (_dataDic != dataDic) _dataDic = dataDic;
    
    NSString *title = [[dataDic allKeys] lastObject];
    NSString *content = dataDic[title];
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    
    
}

@end
