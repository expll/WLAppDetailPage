//
//  TTImageViewWithProcess.h
//  Installer
//
//  Created by kingnet on 14-11-26.
//  Copyright (c) 2014年 www.freetalk.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLProgressImageView : UIImageView

- (instancetype) initWithFrame:(CGRect)frame onCircleType:(BOOL)bCircleType;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
