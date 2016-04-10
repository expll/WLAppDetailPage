//
//  WLAppDetailPageController.m
//  AppDetailPage
//
//  Created by DaChui on 4/9/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLAppDetailPageController.h"
#import "WLContentCell.h"

@interface WLAppDetailPageController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property(nonatomic, assign)IBOutlet UITableView *tableView;
@property(nonatomic, assign)IBOutlet UIView *tableHeadView;
@property(nonatomic, strong)IBOutlet UIView *sectionHeadView;


@end

@implementation WLAppDetailPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.tableHeaderView = self.tableHeadView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


#pragma mark- UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"WLContentCell" bundle:nil] forCellReuseIdentifier:@"WLContentCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentCell"];
        cell.dataArr = @[@{@"更新信息":@"XXOO"}, @{@"游戏信息":@"yyoo"}, @{@"版本信息":@"开发商\tMildMania\n类别\t\t动作射击\n更新日期\t2016-04-08"}];
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1000;
    return self.tableView.frame.size.height - self.tableHeadView.frame.size.height - self.sectionHeadView.frame.size.height;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sectionHeadView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.sectionHeadView.frame.size.height;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{


}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

#pragma mark- WLContentCellDelegate
//- (void)wlContentTableVIewDidScroll:(CGPoint)offset
//{
//    if (offset.y > 0) {
//        self.tableView.contentOffset = offset;
//        WLContentCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        
//    }
//    
//}


@end
