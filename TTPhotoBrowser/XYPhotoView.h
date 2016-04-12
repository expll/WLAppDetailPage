//
//  TTPhotoView.h
//  Installer
//
//  Created by Eason on 01/12/2013.
//  Copyright (c) 2013 www.xyzs.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYPhotoBrowser, XYPhotoView;

@protocol TTPhotoViewDelegate <NSObject>
//
//- (void)photoViewFinishLoad:(TTPhotoView *)photoView;
//- (void)photoViewOnceTap:(TTPhotoView *)photoView;
//- (void)photoViewDidEndZoom:(TTPhotoView *)photoView;

@end

@interface XYPhotoView : UIScrollView

@property (nonatomic, weak) id<TTPhotoViewDelegate> photoViewDelegate;

@end
