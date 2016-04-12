//
//  WLAppDetailPageTool.h
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IPHONE5 ([[UIScreen mainScreen] bounds].size.width == 320)
#define IPHONE6 ([[UIScreen mainScreen] bounds].size.width == 375)
#define IPHONE6PLUS ([[UIScreen mainScreen] bounds].size.width == 414)
#define ICON_CORNER 12.0f
#define BUTTON_CORNER 2.0f
#define WLBackgroundColor [UIColor colorWithRed:218/255.0 green:219/255.0 blue:226/255.0 alpha:1]
#define TTWhiteColor [UIColor whiteColor]
#define TT_IS_IOS8_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define TT_IS_IOS7_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define TT_IS_IOS6_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
#define TTRGBColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define TTRGBAColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define TTHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]
#define kTTNaviBarHeight  (TT_IS_IOS7_AND_UP ? 64.0 : 44.0)
#define TTScreenHeight [[UIScreen mainScreen] bounds].size.height
#define TTScreenWidth [[UIScreen mainScreen] bounds].size.width
#define APPSTORE_LOOKUP @"https://itunes.apple.com/lookup?country=cn&id="

@interface WLAppDetailPageTool : NSObject

+ (NSDictionary *)wlCalculateCellsHeightByTextDictioanry:(NSDictionary *)texts withFont:(NSInteger)fontSize;
+ (CGFloat)wlCalculateCellsHeightByText:(NSString *)text withFont:(NSInteger)fontSize;

+ (UIViewController *)wlTopVC;

@end
