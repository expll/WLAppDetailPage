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

+ (UIViewController *)wlTopVC {
    UIViewController *result;
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows){
            if (topWindow.windowLevel == UIWindowLevelNormal)break;
        }
    }
    
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        result = topWindow.rootViewController;
    else{}
    return result;
}


@end
