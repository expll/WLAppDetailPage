//
//  WLHeadCell.m
//  AppDetailPage
//
//  Created by DaChui on 4/12/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLHeadCell.h"
#import "UIImageView+WebCache.h"

@implementation WLHeadCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setData:(id)data{
    @try {
        NSString *icomUrl = data[@"results"][0][@"artworkUrl100"];
        NSString *name = data[@"results"][0][@"trackName"];
        CGFloat size = [data[@"results"][0][@"fileSizeBytes"] floatValue]/(1024*1024);
        NSString *rate = data[@"results"][0][@"averageUserRating"];
        [self.headView.iconView.imageView sd_setImageWithURL:[NSURL URLWithString:icomUrl] placeholderImage:nil];
        self.headView.nameLable.text = [name stringByAppendingString:@"操你大爷"];
        self.headView.starView.rating = [rate floatValue];
        self.headView.downloadLabel.text = [NSString stringWithFormat:@"%.1fMB", size];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

@end
