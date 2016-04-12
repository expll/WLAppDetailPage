//
//  XYCircleProgress.m
//  XYProgress
//
//  Created by caosq on 15-1-7.
//  Copyright (c) 2015年 xyzs. All rights reserved.
//

#import "XYCircleProgress.h"

#define GLK_INLINE	static __inline__
GLK_INLINE float GLKMathDegreesToRadians(float degrees) { return degrees * (M_PI / 180); };

@interface XYCircleProgress()

@property (nonatomic) float lineWidth;
@property (nonatomic) float circleSize;
@property (nonatomic) float progress;
@property (nonatomic, strong) CAShapeLayer *circleProgressLineLayer;
@property (nonatomic, strong) CAShapeLayer *circleBackgroundLineLayer;
@property (nonatomic, strong) UILabel *lbProgress;

@end

@implementation XYCircleProgress

#pragma mark- life cycle
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.circleSize = 50.0;
        self.lineWidth = 5.0;
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setupProgressCircle];
        [self addSubview:self.lbProgress];
        
        self.progress = 0.0;
        
    }
    return self;
}


#pragma mrak- public methods
- (void)updateProgress:(CGFloat)progress animated:(BOOL)animated
{
    // Boundry correctness
    progress = MIN(progress, 1.0f);
    progress = MAX(progress, 0.0f);
    
    if (animated) {
        
        CABasicAnimation *progressAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        
        progressAnimation.duration = 0.4;
        progressAnimation.removedOnCompletion = NO;
        progressAnimation.fillMode = kCAFillModeBoth;
        progressAnimation.fromValue = @(self.progress);
        progressAnimation.toValue = @(progress);
        progressAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.circleProgressLineLayer addAnimation:progressAnimation forKey:@"strokeEnd"];
        
    } else {
        self.circleProgressLineLayer.strokeEnd = progress;
    }
    
    self.progress = progress;
}

#pragma mark- private methods
- (void)setupProgressCircle
{
    CGFloat radius = (self.circleSize / 2.0f);
    CGPoint center = CGPointMake(radius, radius);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center
                                                              radius:(radius - self.lineWidth)
                                                          startAngle:GLKMathDegreesToRadians(-90.0f)
                                                            endAngle:GLKMathDegreesToRadians(275.0f)
                                                           clockwise:YES];
    
    [self cancelCircleAnimation];
    
    self.circleProgressLineLayer = [CAShapeLayer layer];
    self.circleProgressLineLayer.path = circlePath.CGPath;
    self.circleProgressLineLayer.strokeColor = [UIColor grayColor].CGColor;
    self.circleProgressLineLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleProgressLineLayer.lineCap = @"round";
    self.circleProgressLineLayer.lineWidth = self.lineWidth;
    
    self.circleBackgroundLineLayer = [CAShapeLayer layer];
    self.circleBackgroundLineLayer.path = circlePath.CGPath;
    self.circleBackgroundLineLayer.strokeColor =  [UIColor colorWithWhite:1.0 alpha:0.2].CGColor;
    self.circleBackgroundLineLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleBackgroundLineLayer.lineWidth = self.lineWidth;
    
    [self.layer addSublayer:self.circleBackgroundLineLayer];
    [self.layer addSublayer:self.circleProgressLineLayer];
    
    [self.circleProgressLineLayer removeAllAnimations];
    [self.layer removeAllAnimations];
    
    [self updateProgress:self.progress animated:NO];
}



- (void)cancelCircleAnimation
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    [self.layer removeAllAnimations];
    [self.circleProgressLineLayer removeAllAnimations];
    [self.circleBackgroundLineLayer removeAllAnimations];
    
    self.circleProgressLineLayer.strokeEnd = 0.0f;
    self.circleBackgroundLineLayer.strokeEnd = 0.0f;
    
    if (self.circleProgressLineLayer.superlayer) {
        [self.circleProgressLineLayer removeFromSuperlayer];
    }
    if (self.circleBackgroundLineLayer.superlayer) {
        [self.circleBackgroundLineLayer removeFromSuperlayer];
    }
    
    self.circleProgressLineLayer = nil;
    self.circleBackgroundLineLayer = nil;
    
    [CATransaction commit];
}



#pragma mark- getters and setters
- (void) setProgress:(float)progress
{
    if (_progress != progress) {
        _progress = progress;
        
        self.lbProgress.text = [NSString stringWithFormat:@"%0.0f%%", _progress*100.0];
    }
}

- (UILabel *) lbProgress
{
    if (!_lbProgress) {
        _lbProgress = [[UILabel alloc] initWithFrame:self.bounds];
        [_lbProgress setBackgroundColor:[UIColor clearColor]];
        _lbProgress.font = [UIFont systemFontOfSize:11.0];
        _lbProgress.textColor = [UIColor whiteColor];
        _lbProgress.textAlignment = NSTextAlignmentCenter;
    }
    return _lbProgress;
}


@end
