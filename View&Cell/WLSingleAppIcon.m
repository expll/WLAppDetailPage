//
//  WLSingleAppIcon.m
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLSingleAppIcon.h"
#import "WLAppDetailPageTool.h"
#import "WLAppDetailPageController.h"

@implementation WLSingleAppIcon

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.userInteractionEnabled = YES;
        NSString *className = NSStringFromClass([self class]);
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
        for (UIImageView *view in views) {
            self.imageView = view;
            self.imageView.layer.cornerRadius = ICON_CORNER;
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
        
        [self addSubview:self.imageView];
        return self;
    }
    return nil;
}

- (IBAction)tapMe:(id)sender
{
    WLAppDetailPageController *detail = [[WLAppDetailPageController alloc] initWithNibName:@"WLAppDetailPageController" bundle:nil];
    detail.appID = self.appID;
    [(UINavigationController *)[WLAppDetailPageTool wlTopVC] pushViewController:detail animated:YES];
}

@end
