//
//  WLSingleApp.m
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLSingleApp.h"
#import "WLAppDetailPageTool.h"
#import "UIImageView+WebCache.h"
#import "WLMBProgressHUD.h"
#import <StoreKit/StoreKit.h>

@interface WLSingleApp()<SKStoreProductViewControllerDelegate>{
    SKStoreProductViewController *_storeProductViewContorller;
}

@end

@implementation WLSingleApp

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
        for (UIView *view in views) {
            self.view = view;
            if (view.frame.size.width == 70 && IPHONE6PLUS) {
                break;
            }
            if (view.frame.size.width == 64 && IPHONE6) {
                break;
            }
            if (view.frame.size.width == 64 && IPHONE5) {
                break;
            }
        }

        [self addSubview:self.view];
        return self;
    }
    return nil;
}

- (WLSingleAppIcon *)iconView{
    return _iconView = [self.view viewWithTag:1];
}
- (UILabel*)nameLable{
    return _nameLable = [self.view viewWithTag:2];
}
- (UIButton *)downBtn{
    _downBtn = [self.view viewWithTag:3];
    return _downBtn;
}

- (IBAction)install:(id)sender
{
    [WLMBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    //第二中方法  应用内跳转
    //1:导入StoreKit.framework,控制器里面添加框架#import <StoreKit/StoreKit.h>
    //2:实现代理SKStoreProductViewControllerDelegate
    _storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    _storeProductViewContorller.delegate = self;
    [_storeProductViewContorller loadProductWithParameters:
     //appId
     @{SKStoreProductParameterITunesItemIdentifier : self.iconView.appID} completionBlock:^(BOOL result, NSError *error) {
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

- (void)setData:(id)data{
    @try {
        NSString *icomUrl = data[@"iconUrl"];
        NSString *name = data[@"name"];
        NSString *appID = data[@"appID"];
        
        self.nameLable.text = name;
        [self.iconView.imageView sd_setImageWithURL:[NSURL URLWithString:icomUrl] placeholderImage:nil];
        self.iconView.appID = appID;
        self.downBtn.layer.cornerRadius = BUTTON_CORNER;
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

#pragma mark - 取消按钮监听
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [_storeProductViewContorller dismissViewControllerAnimated:YES completion:nil];
}

@end
