//
//  TTPhotoView.m
//  Installer
//
//  Created by Eason on 01/12/2013.
//  Copyright (c) 2013 www.xyzs.com. All rights reserved.
//

#import "XYPhotoView.h"
#import "UIImageView+WebCache.h"

@interface XYPhotoView ()<UIScrollViewDelegate>
{
    UIImageView *_imageView;
    BOOL _doubleTap;
}
@end


@implementation XYPhotoView

#pragma mark- life cycle
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.clipsToBounds = YES;
		_imageView = [[UIImageView alloc] init];
		_imageView.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:_imageView];
    
		self.backgroundColor = [UIColor clearColor];
		self.delegate = self;
		self.showsHorizontalScrollIndicator = NO;
		self.showsVerticalScrollIndicator = NO;
		self.decelerationRate = UIScrollViewDecelerationRateFast;
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UITapGestureRecognizer *onceTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleOnceTap:)];
        onceTap.delaysTouchesBegan = YES;
        onceTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:onceTap];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
    }
    return self;
}
- (void)dealloc
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@"file:///abc"]];
}

#pragma mark- private methods
- (void)adjustFrame
{
	if (_imageView.image == nil) return;
    
    CGSize boundsSize = self.bounds.size;
    CGFloat boundsWidth = boundsSize.width;
    CGFloat boundsHeight = boundsSize.height;
    
    CGSize imageSize = _imageView.image.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
	
    CGFloat minScale = boundsWidth / imageWidth;
	if (minScale > 1) {
		minScale = 1.0;
	}
	CGFloat maxScale = 2.0;
	if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
		maxScale = maxScale / [[UIScreen mainScreen] scale];
	}
	self.maximumZoomScale = maxScale;
	self.minimumZoomScale = minScale;
	self.zoomScale = minScale;
    
    CGRect imageFrame = CGRectMake(0, 0, boundsWidth, imageHeight * boundsWidth / imageWidth);

    self.contentSize = CGSizeMake(0, imageFrame.size.height);
    
    if (imageFrame.size.height < boundsHeight) {
        imageFrame.origin.y = floorf((boundsHeight - imageFrame.size.height) / 2.0);
	} else {
        imageFrame.origin.y = 0;
	}
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return _imageView;
}


#pragma mark- event response
- (void)handleOnceTap:(UITapGestureRecognizer *)tap
{
    _doubleTap = NO;
    [self performSelector:@selector(hide) withObject:nil afterDelay:0.2];
}


- (void)handleDoubleTap:(UITapGestureRecognizer *)tap {
    _doubleTap = YES;
    
    CGPoint touchPoint = [tap locationInView:self];
	if (self.zoomScale == self.maximumZoomScale) {
		[self setZoomScale:self.minimumZoomScale animated:YES];
	} else {
		[self zoomToRect:CGRectMake(touchPoint.x, touchPoint.y, 1, 1) animated:YES];
	}
}





@end
