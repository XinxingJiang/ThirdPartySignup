//
//  MathUtil.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/15/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation

class MathUtil {
    class func indicator(x: Double) -> Int {
        return (x >= 0 ? 1 : -1)
    }
    
    class func indicator(x: Bool) -> Int {
        return (x ? 1 : -1)
    }
}