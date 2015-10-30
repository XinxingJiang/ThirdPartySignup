//
//  RegularSignupView.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/16/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit

class RegularSignupView: UIView, UITextFieldDelegate {

    // MARK: - Fields
    
    weak var regularSignupController: RegularSignupController! // to get navigation bar
    
    // MARK: - Subviews
    
    var infoView: UIView!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var signupButton: UIButton!
    
    convenience init(regularSignupController: RegularSignupController) {
        self.init()
        self.regularSignupController = regularSignupController
        self.backgroundColor = Constants.BackgroundColor
        initSubviews()
    }
    
    // MARK: - Init subviews
    
    private func initSubviews() {
        initInfoView()
        initEmailTextField()
        initPasswordTextField()
        initFirstNameTextField()
        initLastNameTextField()
        initSeparatorLines() // add separator lines between text fields
        initSignupButton()
    }
    
    // MARK: - Init info view
    
    private func initInfoView() {
        infoView = UIView()
        infoView.backgroundColor = Constants.InfoViewBackgroundColor
        self.addSubview(infoView)
        
        // constraints
        infoView.translatesAutoresizingMaskIntoConstraints = false
        let topGap = UIApplicationUtils.statusBarHeight + regularSignupController.navigationBarHeight! + ConstraintConstants.GapBetweenViews
        let topCon = NSLayoutConstraint(item: infoView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: topGap)
        let leadingCon = NSLayoutConstraint(item: infoView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: infoView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        // compute height
        let height = 4 * (TextFieldConstants.TextFieldHeight + 2 * Constants.GapBetweenTextFieldAndSeparatorLine)
        let heightCon = NSLayoutConstraint(item: infoView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: height)
        self.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init email text field
    
    private func initEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = Constants.EmailTextFieldPlaceholder
        emailTextField.keyboardType = .EmailAddress
        emailTextField.backgroundColor = Constants.TextFieldBackgroundColor
        infoView.addSubview(emailTextField)
        
        // delegate
        emailTextField.delegate = self
        
        // constraints
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let topCon = NSLayoutConstraint(item: emailTextField, attribute: .Top, relatedBy: .Equal, toItem: infoView, attribute: .Top, multiplier: 1, constant: Constants.GapBetweenTextFieldAndSeparatorLine)
        let leadingCon = NSLayoutConstraint(item: emailTextField, attribute: .Leading, relatedBy: .Equal, toItem: infoView, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: emailTextField, attribute: .Trailing, relatedBy: .Equal, toItem: infoView, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let heightCon = NSLayoutConstraint(item: emailTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: TextFieldConstants.TextFieldHeight)
        infoView.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init password text field
    
    private func initPasswordTextField() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = Constants.PasswordTextFieldPlaceholder
        passwordTextField.secureTextEntry = true
        passwordTextField.backgroundColor = Constants.TextFieldBackgroundColor
        infoView.addSubview(passwordTextField)
        
        // delegate
        passwordTextField.delegate = self
        
        // constraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: passwordTextField, attribute: .Top, relatedBy: .Equal, toItem: emailTextField, attribute: .Bottom, multiplier: 1, constant: 2 * Constants.GapBetweenTextFieldAndSeparatorLine)
        let leadingCon = NSLayoutConstraint(item: passwordTextField, attribute: .Leading, relatedBy: .Equal, toItem: emailTextField, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: passwordTextField, attribute: .Trailing, relatedBy: .Equal, toItem: emailTextField, attribute: .Trailing, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: passwordTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: TextFieldConstants.TextFieldHeight)
        infoView.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init first name text field
    
    private func initFirstNameTextField() {
        firstNameTextField = UITextField()
        firstNameTextField.placeholder = Constants.FirstNameTextFieldPlaceholder
        firstNameTextField.backgroundColor = Constants.TextFieldBackgroundColor
        infoView.addSubview(firstNameTextField)
        
        // delegate
        firstNameTextField.delegate = self
        
        // constraints
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: firstNameTextField, attribute: .Top, relatedBy: .Equal, toItem: passwordTextField, attribute: .Bottom, multiplier: 1, constant: 2 * Constants.GapBetweenTextFieldAndSeparatorLine)
        let leadingCon = NSLayoutConstraint(item: firstNameTextField, attribute: .Leading, relatedBy: .Equal, toItem: passwordTextField, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: firstNameTextField, attribute: .Trailing, relatedBy: .Equal, toItem: passwordTextField, attribute: .Trailing, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: firstNameTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: TextFieldConstants.TextFieldHeight)
        infoView.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init last name text field
    
    private func initLastNameTextField() {
        lastNameTextField = UITextField()
        lastNameTextField.placeholder = Constants.LastNameTextFieldPlaceholder
        lastNameTextField.backgroundColor = Constants.TextFieldBackgroundColor
        infoView.addSubview(lastNameTextField)
        
        // delegate
        lastNameTextField.delegate = self
        
        // constraints
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: lastNameTextField, attribute: .Top, relatedBy: .Equal, toItem: firstNameTextField, attribute: .Bottom, multiplier: 1, constant: 2 * Constants.GapBetweenTextFieldAndSeparatorLine)
        let leadingCon = NSLayoutConstraint(item: lastNameTextField, attribute: .Leading, relatedBy: .Equal, toItem: firstNameTextField, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: lastNameTextField, attribute: .Trailing, relatedBy: .Equal, toItem: firstNameTextField, attribute: .Trailing, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: lastNameTextField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: TextFieldConstants.TextFieldHeight)
        infoView.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init separator lines
    
    private func initSeparatorLines() {
        // add three separator lines between four text fields
        initSeparatorLine(belowItem: emailTextField)
        initSeparatorLine(belowItem: passwordTextField)
        initSeparatorLine(belowItem: firstNameTextField)
    }
    
    // MARK: - Init separator line
    
    private func initSeparatorLine(belowItem belowItem: UIView) {
        let line = UIView()
        line.backgroundColor = Constants.SeparatorLineColor
        infoView.addSubview(line)
        
        // constraints
        line.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: line, attribute: .Top, relatedBy: .Equal, toItem: belowItem, attribute: .Bottom, multiplier: 1, constant: Constants.GapBetweenTextFieldAndSeparatorLine)
        let leadingCon = NSLayoutConstraint(item: line, attribute: .Leading, relatedBy: .Equal, toItem: belowItem, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: line, attribute: .Trailing, relatedBy: .Equal, toItem: belowItem, attribute: .Trailing, multiplier: 1, constant: 0)
        let heightCon = NSLayoutConstraint(item: line, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.SeparatorLineHeight)
        infoView.addConstraints([topCon, leadingCon, trailingCon, heightCon])
    }
    
    // MARK: - Init signup button
    
    private func initSignupButton() {
        signupButton = UIButton(type: .System)
        signupButton.setTitle(Constants.SignupButtonTitle, forState: .Normal)
        signupButton.setTitleColor(Constants.SignupButtonTitleColor, forState: .Normal)
        signupButton.changeClickability(clickable: false, interactionEnableBackgroundColor: Constants.SignupButtonEnableBackgroundColor, interactionDisabledBackgroundColor: Constants.SignupButtonDisableBackgroundColor)
        self.addSubview(signupButton)
        
        // add action
        signupButton.addTarget(nil, action: Selector(Constants.SignupButtonSelector), forControlEvents: .TouchUpInside)
        
        // constraints
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: signupButton, attribute: .Top, relatedBy: .Equal, toItem: infoView, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let leadingCon = NSLayoutConstraint(item: signupButton, attribute: .Leading, relatedBy: .Equal, toItem: infoView, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: signupButton, attribute: .Trailing, relatedBy: .Equal, toItem: infoView, attribute: .Trailing, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon, trailingCon])
    }

    // MARK: - Text field delegate
    
    // make signup button clickable if all text fields are not empty
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textAfterEdit = NSString(string: textField.text!).stringByReplacingCharactersInRange(range, withString: string)
        var allTexts = [emailTextField.text!, passwordTextField.text!, firstNameTextField.text!, lastNameTextField.text!]
        if textField == emailTextField {
            allTexts[0] = textAfterEdit
        } else if textField == passwordTextField {
            allTexts[1] = textAfterEdit
        } else if textField == firstNameTextField {
            allTexts[2] = textAfterEdit
        } else {
            allTexts[3] = textAfterEdit
        }
        let allTextNotEmpty = allTexts.filter { (text) -> Bool in
            text.isEmpty
        }.isEmpty
        signupButton.changeClickability(clickable: allTextNotEmpty, interactionEnableBackgroundColor: Constants
            .SignupButtonEnableBackgroundColor, interactionDisabledBackgroundColor: Constants.SignupButtonDisableBackgroundColor)
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            firstNameTextField.becomeFirstResponder()
        } else if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else {
            lastNameTextField.resignFirstResponder()
            regularSignupController.clickSignupButton()
        }
        return true
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor(patternImage: UIImage(named: "regular_signup.png")!)
        
        static let InfoViewBackgroundColor = UIColor.whiteColor()
        
        static let GapBetweenTextFieldAndSeparatorLine = CGFloat(10)

        static let TextFieldBackgroundColor = UIColor.whiteColor()
        
        static let EmailTextFieldPlaceholder = "电子邮件"
        
        static let PasswordTextFieldPlaceholder = "密码"
        
        static let FirstNameTextFieldPlaceholder = "名字"
        
        static let LastNameTextFieldPlaceholder = "姓氏"
        
        static let SeparatorLineColor = UIColor.grayColor()
        static let SeparatorLineHeight = CGFloat(1)
        
        static let SignupButtonTitle = "注册"
        static let SignupButtonTitleColor = UIColor.whiteColor()
        static let SignupButtonEnableBackgroundColor = UIColor.redColor()
        static let SignupButtonDisableBackgroundColor = UIColor.grayColor()
        static let SignupButtonSelector = "clickSignupButton"
    }
}
