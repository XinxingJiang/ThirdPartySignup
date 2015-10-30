//
//  RegularSigninView.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/19/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit

class RegularSigninView: UIView, UITextFieldDelegate {
    
    // MARK: - Fields
    
    weak var regularSigninController: RegularSigninController! // to get navigation bar
    
    // MARK: - Subviews
    
    var infoView: UIView!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var signinButton: UIButton!
    
    convenience init(regularSigninController: RegularSigninController) {
        self.init()
        self.regularSigninController = regularSigninController
        self.backgroundColor = Constants.BackgroundColor
        initSubviews()
    }
    
    // MARK: - Init subviews
    
    private func initSubviews() {
        initInfoView()
        initEmailTextField()
        initPasswordTextField()
        initSeparatorLine(belowItem: emailTextField) // add separator lines between email and password text fields
        initSigninButton()
    }
    
    // MARK: - Init info view
    
    private func initInfoView() {
        infoView = UIView()
        infoView.backgroundColor = Constants.InfoViewBackgroundColor
        self.addSubview(infoView)
        
        // constraints
        infoView.translatesAutoresizingMaskIntoConstraints = false
        let topGap = UIApplicationUtils.statusBarHeight + regularSigninController.navigationBarHeight! + ConstraintConstants.GapBetweenViews
        let topCon = NSLayoutConstraint(item: infoView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: topGap)
        let leadingCon = NSLayoutConstraint(item: infoView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: infoView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        // compute height
        let height = 2 * (TextFieldConstants.TextFieldHeight + 2 * Constants.GapBetweenTextFieldAndSeparatorLine)
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
    
    private func initSigninButton() {
        signinButton = UIButton(type: .System)
        signinButton.setTitle(Constants.SigninButtonTitle, forState: .Normal)
        signinButton.setTitleColor(Constants.SigninButtonTitleColor, forState: .Normal)
        signinButton.changeClickability(clickable: false, interactionEnableBackgroundColor: Constants.SigninButtonEnableBackgroundColor, interactionDisabledBackgroundColor: Constants.SigninButtonDisableBackgroundColor)
        self.addSubview(signinButton)
        
        // add action
        signinButton.addTarget(nil, action: Selector(Constants.SigninButtonSelector), forControlEvents: .TouchUpInside)
        
        // constraints
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: signinButton, attribute: .Top, relatedBy: .Equal, toItem: infoView, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let leadingCon = NSLayoutConstraint(item: signinButton, attribute: .Leading, relatedBy: .Equal, toItem: infoView, attribute: .Leading, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: signinButton, attribute: .Trailing, relatedBy: .Equal, toItem: infoView, attribute: .Trailing, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon, trailingCon])
    }
    
    // MARK: - Text field delegate
    
    // make signup button clickable if all text fields are not empty
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textAfterEdit = NSString(string: textField.text!).stringByReplacingCharactersInRange(range, withString: string)
        var allTexts = [emailTextField.text!, passwordTextField.text!]
        if textField == emailTextField {
            allTexts[0] = textAfterEdit
        } else {
            allTexts[1] = textAfterEdit
        }
        let allTextNotEmpty = allTexts.filter { (text) -> Bool in
            text.isEmpty
            }.isEmpty
        signinButton.changeClickability(clickable: allTextNotEmpty, interactionEnableBackgroundColor: Constants
            .SigninButtonEnableBackgroundColor, interactionDisabledBackgroundColor: Constants.SigninButtonDisableBackgroundColor)
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            regularSigninController.clickSigninButton()
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
        
        static let SeparatorLineColor = UIColor.grayColor()
        static let SeparatorLineHeight = CGFloat(1)
        
        static let SigninButtonTitle = "登录"
        static let SigninButtonTitleColor = UIColor.whiteColor()
        static let SigninButtonEnableBackgroundColor = UIColor.blueColor()
        static let SigninButtonDisableBackgroundColor = UIColor.grayColor()
        static let SigninButtonSelector = "clickSigninButton"
    }
}