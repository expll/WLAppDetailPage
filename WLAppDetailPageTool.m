//
//  WLAppDetailPageTool.m
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLAppDetailPageTool.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation WLAppDetailPageTool

+ (NSDictionary *)wlCalculateCellsHeightByTextDictioanry:(NSDictionary *)texts withFont:(NSInteger)fontSize {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSString *key in [texts allKeys]) {
        NSString *content = texts[key];
        CGFloat height = [self wlCalculateCellsHeightByText:content withFont:fontSize];
        [dic setObject:@(height) forKey:key];
    }
    return dic;
}

+ (CGFloat)wlCalculateCellsHeightByText:(NSString *)text withFont:(NSInteger)fontSize
{
    NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGFloat height = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 36, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size.height;
    
    return height;
}

@end
