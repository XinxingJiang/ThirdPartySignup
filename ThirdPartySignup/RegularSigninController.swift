//
//  RegularSigninController.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/19/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit
import Parse

class RegularSigninController: UIViewController {

    // MARK: - UI view
    
    var regularSigninView: RegularSigninView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        regularSigninView = RegularSigninView(regularSigninController: self)
        self.view.addSubview(regularSigninView)
        
        // constraints
        regularSigninView.frame = self.view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = false
        setBackButtonTitle(title: "") // hide default title "Back"
        regularSigninView.emailTextField.becomeFirstResponder() // init cursor at email text field
        
        // TO DO: debug
        regularSigninView.emailTextField.text = "jiangxinxing09@gmail.com"
        regularSigninView.passwordTextField.text = "aaaaaa"
        clickSigninButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Sign in button action
    
    func clickSigninButton() {
        let email = regularSigninView.emailTextField.text!
        let password = regularSigninView.passwordTextField.text!
        
        // previous check ensures all fields are not empty
        // check email
        if !EmailUtil.isEmailValid(email: email) {
            self.showAlertController(alertTitle: EmailUtil.Constants.InvalidMessage)
        }
        // check password
        if !PasswordUtil.isPasswordValid(password: password) {
            self.showAlertController(alertTitle: PasswordUtil.Constants.InvalidMessage)
        }
        
        // sign in asynchronously
        PFUser.logInWithUsernameInBackground(email, password: password) { (_, error) in
            if error == nil {
                // TO DO: go to main page
                let tabBarController = TabBarController()
                self.pushViewController(viewController: tabBarController)
            } else {
                self.showAlertController(alertTitle: "\(error!.code)")
            }
        }
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let EmailIsInvalid = "邮箱长度应该为6到30个字符，并且格式合法"
        static let PasswordIsInvlid = "密码长度应该为6到30个字符，无效"
    }
}
