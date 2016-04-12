//
//  WLAppDetailPageController.m
//  AppDetailPage
//
//  Created by DaChui on 4/9/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLAppDetailPageController.h"
#import "WLContentCell.h"
#import "WLRelatedCell.h"
#import "WLHeadCell.h"
#import "WLMBProgressHUD.h"
#import "WLAppDetailPageTool.h"
#import "WLAppDetailScreenShotView.h"

@interface WLAppDetailPageController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    NSDictionary *_dataDic;
}
@property(nonatomic, assign)IBOutlet UITableView *tableView;
@property(nonatomic, strong)IBOutlet UIView *sectionHeadView;
@property(nonatomic, strong)WLAppDetailScreenShotView *shot;
@property(nonatomic, weak)IBOutlet UIButton *shareBtn;
@property(nonatomic, weak)IBOutlet UIButton *downloadBtn;

@end

@implementation WLAppDetailPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.downloadBtn.layer.cornerRadius = BUTTON_CORNER;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationItem.title = @"应用详情";
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!_dataDic) {
        [self requestData];
    }
}

- (void)requestData{
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:[APPSTORE_LOOKUP stringByAppendingString:self.appID]]];
    __block typeof(self) weakSelf = self;
    [WLMBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NSURLConnection sendAsynchronousRequest:requst queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [WLMBProgressHUD hideHUDForView:self.view animated:YES];
        });
        if (!connectionError) {
            id JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            _dataDic = JSON;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
                
            });
        }
        
    }];

}

#pragma mark- UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_dataDic) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WLHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLHeadCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"WLHeadCell" bundle:nil] forCellReuseIdentifier:@"WLHeadCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"WLHeadCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.data = _dataDic;
        return cell;
        
    }if (indexPath.row == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Shot"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Shot"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.contentView addSubview:self.shot];
        }
        @try {
            [self.shot setImages:_dataDic[@"results"][0][@"screenshotUrls"]];
        }
        @catch (NSException *exception) {
            NSLog(@"%s,%d, %@", __func__, __LINE__, exception.description);
        }
        
        
        return cell;
    }if (indexPath.row == 2) {
        WLRelatedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLRelatedCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"WLRelatedCell" bundle:nil] forCellReuseIdentifier:@"WLRelatedCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"WLRelatedCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.data = _dataDic;
        return cell;
    }if (indexPath.row == 3) {
        WLContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentCell"];
        if (!cell) {
            [tableView registerNib:[UINib nibWithNibName:@"WLContentCell" bundle:nil] forCellReuseIdentifier:@"WLContentCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"WLContentCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        @try {
            cell.dataArr = @[@{@"应用描述":_dataDic[@"results"][0][@"description"]}];
        }
        @catch (NSException *exception) {
            NSLog(@"%s,%d, %@", __func__, __LINE__, exception.description);
        }
        
        
        return cell;
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return (IPHONE5 || IPHONE6) ? 83 : 83;
    }if (indexPath.row == 1) {
        return 320;
    } else if (indexPath.row == 2) {
        return ((IPHONE5 || IPHONE6) ? 130 : 137) + 44;
    } else if (indexPath.row == 3) {
        CGFloat height = [WLAppDetailPageTool wlCalculateCellsHeightByTextDictioanry:@{@"应用描述":_dataDic[@"results"][0][@"description"]}];
        return height + 50;
                          
    }
    return 1000;

}

- (IBAction)install:(id)sender{
    [WLAppDetailPageTool wlInstallWithAppID:self.appID];
}
- (IBAction)share:(id)sender{
    [[[UIAlertView alloc] initWithTitle:@"分享" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}


#pragma -mark Getter
- (WLAppDetailScreenShotView *)shot{
    if (!_shot) {
        _shot = [[WLAppDetailScreenShotView alloc] initWithFrame:CGRectMake(0.f, 5, self.view.frame.size.width, 301)];
    }
    return _shot;
}

@end
