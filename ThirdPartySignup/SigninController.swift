//
//  SigninController.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/19/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit
import ParseFacebookUtilsV4
import Google

class SigninController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate {

    // MARK: - UI view
    
    var signinView: SigninView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        signinView = SigninView(signinController: self)
        self.view.addSubview(signinView)
        
        // constraints
        signinView.frame = self.view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signinView.emailTextField.delegate = self
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // show navigation bar
        hideNavigationBar = false
        
        // remove default "Back" in navigation bar
        setBackButtonTitle(title: "")
    }
    
    // MARK: - Sina Weibo button action
    
    func clickSinaWeiboButton() {
        self.showDismissAlertController(alertTitle: Constants.SinaWeiboButtonAlertTitle)
    }
    
    // MARK: - Facebook button action
    
    func clickFacebookButton() {
        let permissions = ["user_about_me", "user_relationships", "user_birthday", "user_location"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                } else {
                    print("User logged in through Facebook!")
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        }
    }
        
    // MARK: - Text field delegate
    
    // get called when email text field is clicked
    func textFieldDidBeginEditing(textField: UITextField) {
        // resign first responder
        textField.resignFirstResponder()
        
        // show regular sign in controller
        let regularSigninController = RegularSigninController()
        pushViewController(viewController: regularSigninController)
    }
    
    struct Constants {
        static let SinaWeiboButtonAlertTitle = "TO DO: 打开新浪微博验证"
    }
}