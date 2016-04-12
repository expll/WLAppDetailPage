//
//  WLAppDetailPageTool.m
//  AppDetailPage
//
//  Created by DaChui on 4/10/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLAppDetailPageTool.h"
#import "WLMBProgressHUD.h"
#import <StoreKit/StoreKit.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
SKStoreProductViewController *_storeProductViewContorller;
@implementation WLAppDetailPageTool

+ (CGFloat)wlCalculateCellsHeightByTextDictioanry:(NSDictionary *)texts;{
    CGFloat totalHeight = 0;
    for (NSString *key in [texts allKeys]) {
        NSString *content = texts[key];
        CGFloat height = [self wlCalculateCellsHeightByText:content withFont:APP_DESCRIBE_FONT];
        totalHeight += height;
    }
    return totalHeight;
}

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

+ (void)wlInstallWithAppID:(NSString *)appID{
    [WLMBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    //第二中方法  应用内跳转
    //1:导入StoreKit.framework,控制器里面添加框架#import <StoreKit/StoreKit.h>
    //2:实现代理SKStoreProductViewControllerDelegate
    _storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    _storeProductViewContorller.delegate = self;
    [_storeProductViewContorller loadProductWithParameters:
     //appId
     @{SKStoreProductParameterITunesItemIdentifier : appID} completionBlock:^(BOOL result, NSError *error) {
         [WLMBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
         //回调
         if(error){
             NSLog(@"错误%@",error);
         }else{
             //AS应用界面
             [[WLAppDetailPageTool wlTopVC] presentViewController:_storeProductViewContorller animated:YES completion:nil];
         }
     }];

}

#pragma mark - 取消按钮监听
+ (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [_storeProductViewContorller dismissViewControllerAnimated:YES completion:nil];
}


@end
