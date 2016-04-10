//
//  WLContentCell.m
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLContentCell.h"
#import "WLContentInfoCell.h"
#import "WLAppDetailPageTool.h"

@interface WLContentCell()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation WLContentCell

- (void)awakeFromNib {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}

#pragma mark- UITableViewDataSource UITableViewDelegate UIScrollViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLContentInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentInfoCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"WLContentInfoCell" bundle:nil] forCellReuseIdentifier:@"WLContentInfoCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentInfoCell"];
    }
    @try {
        cell.dataDic = self.dataArr[indexPath.row];
    }
    @catch (NSException *exception) {
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *heights = [WLAppDetailPageTool wlCalculateCellsHeightByTextDictioanry:self.dataArr[indexPath.row] withFont:13];
    NSString *key = [[heights allKeys] lastObject];
    return [heights[key] floatValue] + 40;
}


#pragma mark- Getter/Setter
- (void)setDataArr:(NSArray *)dataArr{
    if (_dataArr != dataArr) _dataArr = dataArr;
    
    
    
    
}



@end
