//
//  WLRelatedCell.m
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLRelatedCell.h"
#import "WLAppDetailPageTool.h"
#import "WLSingleApp.h"
#import "UIImageView+WebCache.h"

@implementation WLRelatedCell

- (void)setData:(id)data{
    @try {
        // 相关应用暂且写死
        NSArray *relateds = @[
                              @{@"appID":@"310633997",@"appIconUrl":@"http://is2.mzstatic.com/image/thumb/Purple49/v4/fc/03/da/fc03dad1-156a-d434-9f7d-3a24b62709e7/source/100x100bb.jpg",@"name":@"WhatsApp Messenger"},
                              @{@"appID":@"835599320",@"appIconUrl":@"http://is1.mzstatic.com/image/thumb/Purple49/v4/25/54/7d/25547d1f-cb70-7112-dbf9-1922f480a524/source/100x100bb.jpg",@"name":@"musical.ly"},
                              @{@"appID":@"368677368",@"appIconUrl":@"http://is2.mzstatic.com/image/thumb/Purple49/v4/f9/3b/80/f93b8096-d518-90d0-d787-bec3cd929fc0/source/100x100bb.jpg",@"name":@"优步Uber"},
                              @{@"appID":@"429047995",@"appIconUrl":@"http://is4.mzstatic.com/image/thumb/Purple49/v4/8b/ad/24/8bad24f5-97af-f0f9-4ba6-d313f3187aa5/source/100x100bb.jpg",@"name":@"Pinterest"},
                              @{@"appID":@"333903271",@"appIconUrl":@"http://is4.mzstatic.com/image/thumb/Purple49/v4/b8/15/27/b81527db-c6ee-2b1d-2f17-d96464f1c073/source/100x100bb.jpg",@"name":@"Twitter"},
                              
                              
                              ];
        
        
        
        for (int i = 0; i < [[self.relatedView.view subviews] count]; i++) {
            NSDictionary *data = @{@"iconUrl":relateds[i][@"appIconUrl"], @"name":relateds[i][@"name"], @"appID":relateds[i][@"appID"]};
            WLSingleApp *view = [self.relatedView.view subviews][i];
            view.data = data;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

@end
