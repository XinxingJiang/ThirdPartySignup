//
//  UIViewControllerExtension.swift
//
//  Created by Xinxing Jiang on 10/5/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var hideNavigationBar: Bool! {
        get {
            return self.navigationController?.navigationBarHidden
        }
        set {
            self.navigationController?.navigationBarHidden = newValue
        }
    }
    
    var navigationBarHeight: CGFloat? {
        return self.navigationController?.navigationBar.frame.height
    }
    
    // push a view controller into the stack
    func pushViewController(viewController viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // set the text showing in back button on the navigation bar
    func setBackButtonTitle(title title: String) {
        self.hideNavigationBar = false // double check navigation bar is shown
        
        if let count = self.navigationController?.viewControllers.count {
            if let previousController = self.navigationController?.viewControllers[count - 2] { // find previous vc on stack
                previousController.navigationItem.title = title
            }
        }
    }
    
    // show an alert controller
    // user needs to click button to dismiss the alert
    func showAlertController(alertTitle alertTitle: String, alertMessage: String = "", actionTitle: String = "OK") {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // show auto disappeared alert
    // dismiss the alert automatically after @delay time
    func showDismissAlertController(alertTitle alertTitle: String, alertMessage: String = "", delay: Double = 0.5) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        self.presentViewController(alert, animated: true, completion: nil)
        
        // dismiss the alert automatically after a while
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) { () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}