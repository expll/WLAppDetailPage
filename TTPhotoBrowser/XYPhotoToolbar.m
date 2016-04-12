////
////  TTPhotoToolbar.m
////  Installer
////
////  Created by Eason on 01/12/2013.
////  Copyright (c) 2013 www.xyzs.com. All rights reserved.
////
//
//#import "XYPhotoToolbar.h"
////#import "UIBezierPath+BasicShapes.h"
//
//#import <QuartzCore/QuartzCore.h>
//
//@interface XYPhotoToolbar ()
//{
////    XYDownProgressButton* _btnInstall;
////    DPMeterView* _shapeView;
//}
//
//@property (nonatomic, strong) UIPageControl *pageControl;
//@end
//
//@implementation XYPhotoToolbar
//
//#pragma mark- life cycle
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
////        UIView* v = [[UIView alloc]initWithFrame:CGRectMake(0, 30, self.width, 50)];
////        //[v setBackgroundColor:TTBlackColor];
////        v.alpha = 0.5;
////        //[self addSubview:v];
////        [v setUserInteractionEnabled:NO];
////        
////        if (!_btnInstall) {
////            
////            
////            CGFloat x = (TTScreenWidth-110)/2;
////            CGFloat y = v.top+9;
////            //[self shapeView:CGRectMake(x, y, 110, 32.5)];
////            _btnInstall = [[XYDownProgressButton alloc] initWithFrame:CGRectMake(x, y, 110, 32.5)];
////            _btnInstall.isFromScreenshort = YES;
////            [_btnInstall setOutsideColor:TTClearColor];
////            
////            [_btnInstall addTarget:self action:@selector(doInstallAction:) forControlEvents:UIControlEventTouchUpInside];
////            _btnInstall.isFromFound = YES;
////            _btnInstall.titleLabel.font =TTSystemFont(15);
////
////        }
////       // [self addSubview:_shapeView];
////      //  [_shapeView setProgress:0.7];
////        [self addSubview:_btnInstall];
////       // [self addSubview:[self btnInstall]];
////        // Initialization code
//    }
//    return self;
//}
//
//- (void) dealloc
//{
//    [[XYAppDownDelegate shareDownDelegate] deallocTarget:_btnInstall itunesId:_btnInstall.itunesId];
//}
//
//#pragma mark- private methods
//- (void)setCurrentPhotoIndex:(NSUInteger)currentPhotoIndex
//{
//    _currentPhotoIndex = currentPhotoIndex;
//    _pageControl.currentPage = currentPhotoIndex;
//}
//
//#pragma mark- event response
//- (void) doInstallAction:(id)sender
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:CLICK_BTN_WITH_SHOW_SCREENSHORT object:nil];
//    
//    BOOL bDowning = [[XYAppDownDelegate shareDownDelegate] doActionWithAppModel:[_appInfo createModelEx] andTarget:sender position:self.iposition iRandIndex:0];
//    if (bDowning) {
//        [[XYAppDownDelegate shareDownDelegate] sendDownActionNotification:_appInfo.appId];
//    }
//    [[XYAppDownDelegate shareDownDelegate] checkItunesId:_appInfo.appId bundleId:_appInfo.appBundleId defaultButtonStatus:TTButtonWithDefault target:sender];
//}
//
//#pragma mark- getters and setters
//- (DPMeterView*)shapeView:(CGRect)frame
//{
//    if (_shapeView == nil) {
//        
//        _shapeView = [[DPMeterView alloc]initWithFrame:frame];
//        [_shapeView setMeterType:DPMeterTypeLinearHorizontal];
//        _shapeView.progressTintColor = [UIColor blueColor];
//        _shapeView.trackTintColor = [UIColor grayColor];
//        [_shapeView setShape:[UIBezierPath bezierPathWithRoundedRect:_shapeView.bounds cornerRadius:16.f].CGPath];
//        [_shapeView.layer setBorderWidth:0.f];
//        [_shapeView.layer setBorderColor:[UIColor clearColor].CGColor];
//    }
//    return _shapeView;
//}
//
//- (void) setAppInfo:(TTHttpAppDetailApp *)appInfo
//{
//    if (_appInfo != appInfo) {
//        _appInfo = appInfo;
//        
//        _btnInstall.itunesId = _appInfo.appId;
//        _btnInstall.bundleId = _appInfo.appBundleId;
//        
//        [[XYAppDownDelegate shareDownDelegate] checkItunesId:_appInfo.appId bundleId:_appInfo.appBundleId defaultButtonStatus:TTButtonWithDefault target:_btnInstall];
//    }
//}
//
//
//- (void)setPhotos:(NSArray *)photos
//{
//    _photos = photos;
//    
//    if (_photos.count > 1) {
//        _pageControl = [[UIPageControl alloc] init];
//        _pageControl.center = CGPointMake(self.width/2, 10.f);
//        _pageControl.numberOfPages = [photos count];
//        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
//        [self addSubview:_pageControl];
//    }
//}
//
//
//@end
