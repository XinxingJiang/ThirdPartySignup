//
//  UIButtonExtension.swift
//
//  Created by Xinxing Jiang on 10/2/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    // button background color indicates clickablility
    func changeClickability(clickable clickable: Bool, interactionEnableBackgroundColor: UIColor = ButtonColorConstants.InteractionEnabledBackgroundColor, interactionDisabledBackgroundColor: UIColor = ButtonColorConstants.InteractionDisabledBackgroundColor) {
        self.userInteractionEnabled = clickable
        self.backgroundColor = clickable ? interactionEnableBackgroundColor : interactionDisabledBackgroundColor
    }
}

struct ButtonColorConstants {
    static let InteractionEnabledBackgroundColor = UIColor.blueColor()
    static let InteractionDisabledBackgroundColor = UIColor.grayColor()
}