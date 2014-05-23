//
//  BlueGradientBackgroundView.m
//  Show My Selfie
//
//  Created by Himanshu on 5/8/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "BlueGradientBackgroundView.h"

@implementation BlueGradientBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    size_t count = 5;
    
    CGFloat components[20] = {
        51.0/255.0, 153.0/255.0, 255.0/255.0, 1.0,
        51.0/255.0, 153.0/255.0, 255.0/255.0, 0.9,
        51.0/255.0, 153.0/255.0, 255.0/255.0, 0.8,
        51.0/255.0, 153.0/255.0, 255.0/255.0, 0.6,
        51.0/255.0, 153.0/255.0, 255.0/255.0, 0.4
    };
    
    CGFloat locations[5] = {0.0, 0.25, 0.5, 0.75, 1.0};
    
    CGColorSpaceRef rgbColorspace = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef gradientRef = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, count);
    
    CGPoint startPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
    
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);

    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(rgbColorspace);
    
}

@end
