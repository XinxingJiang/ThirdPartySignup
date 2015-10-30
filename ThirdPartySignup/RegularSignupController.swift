//
//  RegularSignupController.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/16/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit
import Parse

class RegularSignupController: UIViewController {

    // MARK: - UI view
    
    var regularSignupView: RegularSignupView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        regularSignupView = RegularSignupView(regularSignupController: self)
        self.view.addSubview(regularSignupView)
        
        // constraints
        regularSignupView.frame = self.view.frame        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = false
        setBackButtonTitle(title: "") // hide default title "Back"
        regularSignupView.emailTextField.becomeFirstResponder() // init cursor at email text field
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Sign up button action
    
    func clickSignupButton() {
        let email = regularSignupView.emailTextField.text!
        let password = regularSignupView.passwordTextField.text!
        let firstName = regularSignupView.firstNameTextField.text!
        let lastName = regularSignupView.lastNameTextField.text!

        // previous check ensures all fields are not empty
        // check email
        if !EmailUtil.isEmailValid(email: email) {
            self.showAlertController(alertTitle: EmailUtil.Constants.InvalidMessage)
        }
        // check password
        if !PasswordUtil.isPasswordValid(password: password) {
            self.showAlertController(alertTitle: PasswordUtil.Constants.InvalidMessage)
        }
        
        // create PFObject
        let user = PFUser()
        user.username = email
        user.password = password
        user.email = email
        user.setValue(firstName, forKey: ParseFields.FirstName)
        user.setValue(lastName, forKey: ParseFields.LastName)
        // full name is for search usage, apply lower case to enable case insensitivity
        user.setValue("\(firstName.lowercaseString) \(lastName.lowercaseString)", forKey: ParseFields.FullName)
        
        // save to database asynchronous
        user.signUpInBackgroundWithBlock { (_, error) in
            if error == nil {
                // TO DO: go to sign in page
                self.showAlertController(alertTitle: "Succeed!")
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
