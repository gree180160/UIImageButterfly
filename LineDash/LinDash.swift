//
//  LinDash.swift
//  LineDash
//
//  Created by WillowRivers on 16/6/24.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class LinDash: UIView {
    
    var pase : CGFloat? ;
    var length : Array<CGFloat>? = [13 , 10];
    override init(frame: CGRect)
    {
        super.init(frame: frame) ;
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) ;
    }
   
    override func drawRect(rect: CGRect) {
        
        
        let ctx = UIGraphicsGetCurrentContext();
        CGContextSetLineDash(ctx, pase! , length!, length!.count) ;
        CGContextSetLineWidth(ctx, 8) ;
        CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1) ;
        CGContextSetLineJoin(ctx, .Miter) ;
        CGContextStrokeRect(ctx, CGRectMake(10, 10, 200, 200)) ;
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
