//
//  XYAppDetailScreenShotView.m
//  XYJB
//
//  Created by wangl on 15/10/23.
//  Copyright © 2015年 xyzs. All rights reserved.
//

#import "WLAppDetailScreenShotView.h"
#import "XYPhotoBrowser.h"
#import "WLProgressImageView.h"

#define kTTScrollViewWidth    168.f
#define kTTScrollViewHeight   290.f
#define kTTPageControlHeight  20.f
#define kTTPageSpaceWidth     160.f
#define KTTImageContentWidthNormal 170
#define KTTImageWidthNormal 165


@interface WLAppDetailScreenShotView ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
{
}

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *screenShotImages;
@property (nonatomic, strong) UIScrollView *bgScrollView;

@end

@implementation WLAppDetailScreenShotView

#pragma mark- life cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self addSubview:[self bgScrollView]];
    }
    return self;
}

#pragma mark- private methods
- (void)setScreenShotImages:(NSArray *)screenShotImages
{
    if (_screenShotImages != screenShotImages) {
        _screenShotImages = screenShotImages;
        [self loadScreenShotImages];
    }
}

- (void)loadScreenShotImages
{
    NSInteger count = [_screenShotImages count];
    [_bgScrollView setContentSize:CGSizeMake(count * KTTImageContentWidthNormal, self.frame.size.height)];
    for (int index = 0; index < count; index++)
    {
        UIView* bgview = [[UIView alloc]initWithFrame:CGRectMake(index * KTTImageContentWidthNormal, 0.5, KTTImageContentWidthNormal, self.frame.size.height-1)];
        
        WLProgressImageView *imageView = [[WLProgressImageView alloc] initWithFrame:CGRectMake(5, 0, KTTImageWidthNormal, bgview.frame.size.height)];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[_screenShotImages objectAtIndex:index]] placeholderImage:[UIImage imageNamed:@"loading_screenshort"]];
        
        [bgview addSubview:imageView];
        [_bgScrollView addSubview:bgview];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)]];
        imageView.tag = 1000 + index;
        
    }
}


#pragma mark- event response
- (void)tapImageView:(UITapGestureRecognizer *)tap
{
    XYPhotoBrowser *browser = [[XYPhotoBrowser alloc] init];
    browser.currentPhotoIndex = (tap.view.tag - 1000);
    browser.photos = _screenShotImages;
    [browser show];
    return;
}



#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGPoint p = scrollView.contentOffset;
    NSInteger it = p.x/KTTImageContentWidthNormal;
    [scrollView setContentOffset:CGPointMake(it*KTTImageContentWidthNormal, p.y) animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark- getters and setters
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0.f, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
        _bgScrollView.delegate = self;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.showsVerticalScrollIndicator = NO;
        _bgScrollView.scrollsToTop = NO;
        _bgScrollView.pagingEnabled = NO;
        _bgScrollView.clipsToBounds = YES;
        [_bgScrollView setContentSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];

    }

    return _bgScrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.f, kTTScrollViewHeight, [UIScreen mainScreen].bounds.size.width, kTTPageControlHeight)];
    }

    return _pageControl;
}

- (void)setImages:(NSArray *)imageUrls
{
    [self setScreenShotImages:imageUrls];
}

@end
