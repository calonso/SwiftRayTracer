//
//  TargetView.swift
//  RayTracerExample
//
//  Created by Carlos Alonso on 03/11/2014.
//  Copyright (c) 2014 MyDrive Solutions. All rights reserved.
//

import UIKit

class TargetView: UIView {
  /*
  var ctx : CGContextRef?

  func hitAt(point: CGPoint) -> Bool {
    var pointer = UnsafeMutablePointer<Void>.alloc(4)
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let context = CGBitmapContextCreate(&pointer,
      1, 1, 8, 4, colorSpace, CGImageAlphaInfo.Last as CGBitmapInfo);
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    self.layer.renderInContext(context)
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIColor *color = [UIColor colorWithRed:pixel[0]/255.0
      green:pixel[1]/255.0 blue:pixel[2]/255.0
      alpha:pixel[3]/255.0];
    return color;
  }
  
  override func drawRect(rect: CGRect) {
    ctx = UIGraphicsGetCurrentContext()
  }
  */
}
