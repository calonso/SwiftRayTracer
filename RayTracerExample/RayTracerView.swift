//
//  RayTracerView.swift
//  RayTracerExample
//
//  Created by Carlos Alonso on 03/11/2014.
//  Copyright (c) 2014 MyDrive Solutions. All rights reserved.
//

import UIKit

class RayTracerView: UIView {
  
  @IBOutlet weak var targetView: ObjCTargetView!
  let kTileWidth = 10.0 as CGFloat
  
  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetLineWidth(context, 2)
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1)
    
    for var i = 0.0 as CGFloat ; i < rect.width / kTileWidth ; ++i {
      for var j = 0.0 as CGFloat ; j < rect.height / kTileWidth ; ++j {
        
        let color = targetView.hitAt(CGPointMake((i + 0.5) * kTileWidth, (j + 0.5) * kTileWidth))
        
        var red : CGFloat = 0.0
        var green : CGFloat = 0.0
        var blue : CGFloat = 0.0
        var alpha : CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        println("\(red) \(green) \(blue) \(alpha)")
        CGContextSetRGBFillColor(context, red, green, blue, alpha)
        CGContextFillRect(context, CGRectMake(i * kTileWidth, j * kTileWidth, kTileWidth, kTileWidth))
        
        CGContextStrokeRect(context, CGRectMake(i * kTileWidth, j * kTileWidth, kTileWidth, kTileWidth))
      }
    }
    
    
//    CGContextSetRGBFillColor(context, 1, 0, 0, 1)
//    CGContextFillRect(context, CGRectMake(100, 100, 100, 100))
    
    CGContextFlush(context)
  }

}
