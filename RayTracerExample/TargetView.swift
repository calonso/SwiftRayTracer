//
//  TargetView.swift
//  RayTracerExample
//
//  Created by Carlos Alonso on 03/11/2014.
//  Copyright (c) 2014 MyDrive Solutions. All rights reserved.
//

import UIKit

class TargetView: UIView {

  func colorAt(point: CGPoint) -> UIColor {
    var pixel = [CUnsignedChar](count: 4, repeatedValue: 0)
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    var context = CGBitmapContextCreate(&pixel,
      1, 1, 8, 4, colorSpace, CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue));
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    self.layer.renderInContext(context)
    
    var red = CGFloat(Double(pixel[0]) / 255.0)
    var green = CGFloat(Double(pixel[1]) / 255.0)
    var blue = CGFloat(Double(pixel[2]) / 255.0)
    var alpha = CGFloat(Double(pixel[3]) / 255.0)
    
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  override func drawRect(rect: CGRect) {
    let ctx = UIGraphicsGetCurrentContext()
    CGContextSetRGBFillColor(ctx, 0.0, 0.0, 1.0, 1.0)
    CGContextFillEllipseInRect(ctx, CGRectMake(100, 100, 100, 100))
    
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 0.0, 1.0)
    CGContextBeginPath(ctx)
    CGContextMoveToPoint(ctx, 150, 150)
    CGContextAddLineToPoint(ctx, 250, 100)
    CGContextAddLineToPoint(ctx, 250, 200)
    CGContextAddLineToPoint(ctx, 150, 150)
    CGContextClosePath(ctx)
    CGContextFillPath(ctx)
  }
}
