//
//  WLHeadView.m
//  AppDetailPage
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLHeadView.h"
#import "WLAppDetailPageTool.h"

@implementation WLHeadView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
        for (UIView *view in views) {
            self.view = view;
            if (view.frame.size.width == 414 && IPHONE6PLUS) break;
            if (view.frame.size.width == 375 && IPHONE6) break;
            if (view.frame.size.width == 320 && IPHONE5) break;
        }
        
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

- (WLSingleAppIcon *)iconView{
    return _iconView = [self viewWithTag:1];
}
- (UILabel*)nameLable{
    return _nameLable = [self viewWithTag:2];
}
- (UIView *)starView{
    _starView = [self viewWithTag:3];
    _starView.starSize = 10;
    _starView.starFillColor = [UIColor orangeColor];
    return _starView;
}
- (UILabel *)downloadLabel{
    return _downloadLabel = [self viewWithTag:4];
}

@end
