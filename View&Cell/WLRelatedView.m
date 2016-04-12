//
//  WLRelatedView.m
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLRelatedView.h"
#import "WLAppDetailPageTool.h"

@implementation WLRelatedView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
        for (UIView *view in views) {
            self.view = view;
            if (view.frame.size.width == 414 && IPHONE6PLUS) {
                break;
            }
            if (view.frame.size.width == 375 && IPHONE6) {
                break;
            }
            if (view.frame.size.width == 320 && IPHONE5) {
                break;
            }
        }
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

@end
