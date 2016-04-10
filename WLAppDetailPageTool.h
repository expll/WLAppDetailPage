//
//  WLAppDetailPageTool.h
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLAppDetailPageTool : NSObject

+ (NSDictionary *)wlCalculateCellsHeightByTextDictioanry:(NSDictionary *)texts withFont:(NSInteger)fontSize;
+ (CGFloat)wlCalculateCellsHeightByText:(NSString *)text withFont:(NSInteger)fontSize;

@end
