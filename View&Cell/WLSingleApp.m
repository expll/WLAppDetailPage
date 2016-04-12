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

@interface WLSingleApp(){
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

- (IBAction)install:(id)sender{
    [WLAppDetailPageTool wlInstallWithAppID:self.iconView.appID];
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

@end
