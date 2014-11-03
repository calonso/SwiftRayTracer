//
//  ObjCTargetView.m
//  RayTracerExample
//
//  Created by Carlos Alonso on 03/11/2014.
//  Copyright (c) 2014 MyDrive Solutions. All rights reserved.
//

#import "ObjCTargetView.h"

@implementation ObjCTargetView

- (UIColor *) hitAt:(CGPoint)point {
  unsigned char pixel[4] = {0};
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = CGBitmapContextCreate(pixel,
                                               1, 1, 8, 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
  
  CGContextTranslateCTM(context, -point.x, -point.y);
  
  [self.layer renderInContext:context];
  
  CGContextRelease(context);
  CGColorSpaceRelease(colorSpace);
  UIColor *color = [UIColor colorWithRed:pixel[0]/255.0
                                   green:pixel[1]/255.0 blue:pixel[2]/255.0
                                   alpha:pixel[3]/255.0];
  return color;
}

- (void) drawRect:(CGRect)rect {
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSetRGBFillColor(ctx, 0.0, 0.0, 1.0, 1.0);
  CGContextFillEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
}

@end
