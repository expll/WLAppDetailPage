//
//  XYPhotoBrowser.m
//  Installer
//
//  Created by Eason on 01/12/2013.
//  Copyright (c) 2013 www.xyzs.com. All rights reserved.
//

#import "XYPhotoBrowser.h"
//#import "XYPhotoToolbar.h"
#import "XYPhotoView.h"
#import "WLProgressImageView.h"
#import "UIImageView+WebCache.h"

#define kTTPhotoViewPadding 10
#define kTTPhotoViewTagOffset 1000
#define kTTPhotoViewIndex(photoView) ([photoView tag] - kTTPhotoViewTagOffset)

@interface XYPhotoBrowser ()<UIScrollViewDelegate, TTPhotoViewDelegate>
{
    NSMutableSet *_visiblePhotosViews;
    NSMutableSet *_resusablePhotoViews;
    BOOL _isStatusBarHidden;
}

@property (nonatomic, strong) UIScrollView *photoScrollView;
//@property (nonatomic, strong) XYPhotoToolbar *toolbar;


@end

@implementation XYPhotoBrowser


#pragma mark- life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _isStatusBarHidden = [UIApplication sharedApplication].isStatusBarHidden;
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        //self.view.backgroundColor = TTLightGrayColor;
        [self.view addSubview:[self photoScrollView]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- public methods 
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.view];
    [window.rootViewController addChildViewController:self];
}

#pragma mark- private methods
- (void)loadPhotoViews
{
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    NSInteger count = [_photos count];
    [_photoScrollView setContentSize:CGSizeMake(count * (viewWidth + kTTPhotoViewPadding * 2), viewHeight)];
    for (int index = 0; index < count; index++) {
        WLProgressImageView *imageView = [[WLProgressImageView alloc] initWithFrame:CGRectMake(kTTPhotoViewPadding + index * (viewWidth + 2 *kTTPhotoViewPadding), 0.f, viewWidth, viewHeight)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[_photos objectAtIndex:index]] placeholderImage:[UIImage imageNamed:@"loading_screenshort"]];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 1000 + index;
        UITapGestureRecognizer *onceTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleOnceTap:)];
        onceTap.delaysTouchesBegan = YES;
        onceTap.numberOfTapsRequired = 1;
        [imageView addGestureRecognizer:onceTap];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        doubleTap.numberOfTapsRequired = 2;
        [imageView addGestureRecognizer:doubleTap];
        //TTDEBUGLOG(@"current is %d", index);
        [_photoScrollView addSubview:imageView];
    }
    
    //[self.view addSubview:[self toolbar]];
    [self updateToolbarStatus];
}

- (void)setCurrentPhotoIndex:(NSUInteger)currentPhotoIndex
{
    _currentPhotoIndex = currentPhotoIndex;
    
    if ([self isViewLoaded]) {
        _photoScrollView.contentOffset = CGPointMake(_currentPhotoIndex * _photoScrollView.frame.size.width, 0);
    }
}

- (void)updateToolbarStatus
{
    _currentPhotoIndex = _photoScrollView.contentOffset.x / _photoScrollView.frame.size.width;
    //_toolbar.currentPhotoIndex = _currentPhotoIndex;
}


#pragma mark- event response
- (void)handleOnceTap:(UIGestureRecognizer *)tap
{
    //TTDEBUGLOG(@"once tap.");
    [UIApplication sharedApplication].statusBarHidden = _isStatusBarHidden;
    //self.view.backgroundColor = TTClearColor;
    //[_toolbar removeFromSuperview];
    //_toolbar = nil;
    
    [self.view removeFromSuperview];
    //    [self removeFromParentViewController];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)tap
{
    //TTDEBUGLOG(@"double tap.");
}

#pragma mark- getters and setters
- (UIScrollView *)photoScrollView
{
    if (!_photoScrollView) {
        CGRect frame = self.view.bounds;
        frame.origin.x -= kTTPhotoViewPadding;
        frame.size.width += (2 * kTTPhotoViewPadding);
        _photoScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _photoScrollView.clipsToBounds = NO;
        _photoScrollView.pagingEnabled = YES;
        _photoScrollView.delegate = self;
        _photoScrollView.showsHorizontalScrollIndicator = NO;
        _photoScrollView.showsVerticalScrollIndicator = NO;
        _photoScrollView.backgroundColor = [UIColor blackColor];
    }
    
    return _photoScrollView;
}


- (void)setPhotos:(NSArray *)photos
{
    if (_photos != photos) {
        _photos = photos;
        [self loadPhotoViews];
    }
}

#pragma mark- TTPhotoViewDelegate
- (void)photoViewOnceTap:(XYPhotoView *)photoView
{
    [UIApplication sharedApplication].statusBarHidden = _isStatusBarHidden;
    //self.view.backgroundColor = TTClearColor;
    //[_toolbar removeFromSuperview];
}

- (void)photoViewDidEndZoom:(XYPhotoView *)photoView
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}


#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateToolbarStatus];
}



@end

