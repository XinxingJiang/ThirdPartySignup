//
//  AgreementConstants.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/16/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import UIKit

class Agreement {
    static var attributedText: NSAttributedString {
        get {
            let attributedString = NSMutableAttributedString(string: "")
            let part1 = NSAttributedString(string: Constants.Text1, attributes: [NSForegroundColorAttributeName: Constants.TextColor])
            let part2 = NSAttributedString(string: Constants.Text2, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue, NSLinkAttributeName: NSURL(string: Constants.Link1)!])
            let part3 = NSAttributedString(string: Constants.Text3, attributes: [NSForegroundColorAttributeName: Constants.TextColor])
            let part4 = NSAttributedString(string: Constants.Text4, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue, NSLinkAttributeName: NSURL(string: Constants.Link2)!])
            let part5 = NSAttributedString(string: Constants.Text5, attributes: [NSForegroundColorAttributeName: Constants.TextColor])
            let part6 = NSAttributedString(string: Constants.Text6, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue, NSLinkAttributeName: NSURL(string: Constants.Link3)!])
            let part7 = NSAttributedString(string: Constants.Text7, attributes: [NSForegroundColorAttributeName: Constants.TextColor])
            let part8 = NSAttributedString(string: Constants.Text8, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue, NSLinkAttributeName: NSURL(string: Constants.Link4)!])
            let part9 = NSAttributedString(string: Constants.Text9)
            attributedString.appendAttributedString(part1)
            attributedString.appendAttributedString(part2)
            attributedString.appendAttributedString(part3)
            attributedString.appendAttributedString(part4)
            attributedString.appendAttributedString(part5)
            attributedString.appendAttributedString(part6)
            attributedString.appendAttributedString(part7)
            attributedString.appendAttributedString(part8)
            attributedString.appendAttributedString(part9)
            return attributedString
        }
    }
    
    struct Constants {
        static let Text1 = "注册即表示我同意11bnb的"
        static let Text2 = "服务条款"
        static let Text3 = "、"
        static let Text4 = "隐私政策"
        static let Text5 = "、"
        static let Text6 = "房客退款政策"
        static let Text7 = "及"
        static let Text8 = "房东保障计划条款"
        static let Text9 = "。"
        static let Link1 = "https://zh.m.airbnb.com/terms"
        static let Link2 = "https://zh.m.airbnb.com/terms/privacy_policy"
        static let Link3 = "https://zh.m.airbnb.com/terms/guest_refund_policy"
        static let Link4 = "https://zh.m.airbnb.com/terms/host_guarantee"
        static let TextColor = UIColor.whiteColor()
    }
}