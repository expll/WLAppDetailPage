//
//  WLAppDetailPageController.m
//  AppDetailPage
//
//  Created by DaChui on 4/9/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLAppDetailPageController.h"

@interface WLAppDetailPageController ()

@property(nonatomic, assign)IBOutlet UITableView *tableView;
@property(nonatomic, assign)IBOutlet UIView *tableHeadView;


@end

@implementation WLAppDetailPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    

    
    self.tableView.tableHeaderView = self.tableHeadView;


    
    
}

- (void)viewWillLayoutSubviews
{
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
