//
//  SignupView.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/15/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit
import Google

class SignupView: UIView, UITextViewDelegate {
    
    // MARK: - Fields
    
    weak var signupController: SignupController!
    
    // MARK: - Subviews
    
    var quickSignupLabel: UILabel!
    var sinaWeiboButton: UIButton!
    var facebookButton: UIButton!
    var googleButton: GIDSignInButton!
    var optionsButton: UIButton!
    var emailSignupLabel: UILabel!
    var emailTextField: UITextField!
    var agreementTextView: UITextView!

    convenience init(signupController: SignupController) {
        self.init()
        self.signupController = signupController
        self.backgroundColor = Constants.BackgroundColor
        initSubviews()
        changeOptions(showMore: false) // default to fewer options
    }
        
    // MARK: - Init subviews
    
    private func initSubviews() {
        initQuickSignupLabel()
        initSinaWeiboButton()
        initFacebookButton()
        initGoogleButton()
        initOptionsButton()
        initEmailSignupLabel()
        initEmailTextField()
        initAgreementTextView()
    }
    
    // MARK: - Init quick signup label
    
    private func initQuickSignupLabel() {
        quickSignupLabel = UILabel()
        quickSignupLabel.text = Constants.QuickSignupLabelText
        quickSignupLabel.textAlignment = .Left
        quickSignupLabel.textColor = Constants.QuickSignupLabelTextColor
        self.addSubview(quickSignupLabel)
        
        // constranints
        quickSignupLabel.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: quickSignupLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let topGap = UIApplicationUtils.statusBarHeight + signupController.navigationBarHeight! + ConstraintConstants.GapBetweenViews
        let topCon = NSLayoutConstraint(item: quickSignupLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: topGap)
        self.addConstraints([leadingCon, topCon])
    }
    
    // MARK: - Init Sina Weibo button
    
    private func initSinaWeiboButton() {
        sinaWeiboButton = UIButton(type: .System)
        sinaWeiboButton.setTitle(Constants.SinaWeiboButtonTitle, forState: .Normal)
        sinaWeiboButton.setTitleColor(Constants.SinaWeiboButtonTitleColor, forState: .Normal)
        sinaWeiboButton.backgroundColor = Constants.SinaWeiboButtonBackgroundColor
        self.addSubview(sinaWeiboButton)
        
        // add action
        sinaWeiboButton.addTarget(nil, action: Selector(Constants.SinaWeiboButtonSelector), forControlEvents: .TouchUpInside)
        
        // constranints
        sinaWeiboButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: sinaWeiboButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: sinaWeiboButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let topCon = NSLayoutConstraint(item: sinaWeiboButton, attribute: .Top, relatedBy: .Equal, toItem: quickSignupLabel, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, topCon])
    }
    
    // MARK: - Init Facebook button
    
    private func initFacebookButton() {
        facebookButton = UIButton(type: .System)
        facebookButton.setTitle(Constants.FacebookButtonTitle, forState: .Normal)
        facebookButton.setTitleColor(Constants.FacebookButtonTitleColor, forState: .Normal)
        facebookButton.backgroundColor = Constants.FacebookButtonBackgroundColor
        self.addSubview(facebookButton)
        
        // add action
        facebookButton.addTarget(nil, action: Selector(Constants.FacebookButtonSelector), forControlEvents: .TouchUpInside)
        
        // constranints
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: facebookButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: facebookButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let topCon = NSLayoutConstraint(item: facebookButton, attribute: .Top, relatedBy: .Equal, toItem: sinaWeiboButton, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, topCon])
    }
    
    // MARK: - Init Google button
    
    private func initGoogleButton() {
        googleButton = GIDSignInButton()
        self.addSubview(googleButton)
        
        // default to hidden
        googleButton.hidden = true
        
        // add action
//        googleButton.addTarget(nil, action: Selector(Constants.GoogleButtonSelector), forControlEvents: .TouchUpInside)
        
        // constranints
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: googleButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: googleButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let topCon = NSLayoutConstraint(item: googleButton, attribute: .Top, relatedBy: .Equal, toItem: facebookButton, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, topCon])
    }
    
    // MARK: - Init options button
    
    private func initOptionsButton() {
        optionsButton = UIButton(type: .Custom)
        optionsButton.setTitle(Constants.MoreOptionsButtonTitle, forState: .Normal) // place holder
        optionsButton.setTitleColor(Constants.OptionsButtonTitleColor, forState: .Normal)
        self.addSubview(optionsButton)
        
        // add action
        optionsButton.addTarget(self, action: Selector(Constants.OptionsButtonSelector), forControlEvents: .TouchUpInside)
        
        // constranints
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXCon = NSLayoutConstraint(item: optionsButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let topCon = NSLayoutConstraint(item: optionsButton, attribute: .Top, relatedBy: .Equal, toItem: facebookButton, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        self.addConstraints([centerXCon, topCon])
    }
    
    // MARK: - Otions button action
    
    func clickOptionsButton() {
        let showMore = (optionsButton.titleForState(.Normal) == Constants.MoreOptionsButtonTitle)
        changeOptions(showMore: showMore)
    }
    
    // MARK: - Change options
    
    private func changeOptions(showMore showMore: Bool) { // true: show more, false: show fewer
        // switch Google button visibility
        googleButton.shown = showMore

        // switch option button title
        optionsButton.setTitle(showMore ? Constants.FewerOptionsButtonTitle : Constants.MoreOptionsButtonTitle, forState: .Normal)

        // change layout
        let yOffet = CGFloat(MathUtil.indicator(showMore)) * CGFloat(googleButton.frame.height + ConstraintConstants.GapBetweenViews)
        optionsButton.frame.offsetInPlace(dx: 0, dy: yOffet)
        emailSignupLabel.frame.offsetInPlace(dx: 0, dy: yOffet)
        emailTextField.frame.offsetInPlace(dx: 0, dy: yOffet)
    }
    
    // MARK: - Init email signup label
    
    private func initEmailSignupLabel() {
        emailSignupLabel = UILabel()
        emailSignupLabel.text = Constants.EmailSignupLabelText
        emailSignupLabel.textAlignment = .Left
        emailSignupLabel.textColor = Constants.EmailSignupLabelTextColor
        self.addSubview(emailSignupLabel)
        
        // constranints
        emailSignupLabel.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: emailSignupLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let topCon = NSLayoutConstraint(item: emailSignupLabel, attribute: .Top, relatedBy: .Equal, toItem: optionsButton, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, topCon])
    }
    
    // MARK: - Init email text field
    
    private func initEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = Constants.EmailTextFieldPlaceholder
        emailTextField.textAlignment = .Left
        emailTextField.backgroundColor = Constants.EmailTextFieldBackgroundColor
        self.addSubview(emailTextField)
        
        // constraints
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: emailTextField, attribute: .Top, relatedBy: .Equal, toItem: emailSignupLabel, attribute: .Bottom, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let leadingCon = NSLayoutConstraint(item: emailTextField, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: emailTextField, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        self.addConstraints([topCon, leadingCon, trailingCon])
    }
    
    // MARK: - Init agreement text view
    
    private func initAgreementTextView() {
        agreementTextView = UITextView()
        agreementTextView.scrollEnabled = false
        agreementTextView.editable = false
        agreementTextView.backgroundColor = nil
        agreementTextView.textContainer.lineFragmentPadding = 0;
        agreementTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.addSubview(agreementTextView)
        
        // delegate
        agreementTextView.delegate = self
        
        // attributed string
        agreementTextView.attributedText = Agreement.attributedText

        // constraints
        agreementTextView.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: agreementTextView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: agreementTextView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let bottomCon = NSLayoutConstraint(item: agreementTextView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, bottomCon])
    }
    
    // MARK: - Text view delegate
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return true
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor(patternImage: UIImage(named: "signup.png")!)
        
        static let QuickSignupLabelText = "通过以下网站快速注册："
        static let QuickSignupLabelTextColor = UIColor.whiteColor()
        
        static let SinaWeiboButtonTitle = "新浪微博"
        static let SinaWeiboButtonTitleColor = UIColor.whiteColor()
        static let SinaWeiboButtonBackgroundColor = UIColor.redColor()
        static let SinaWeiboButtonSelector = "clickSinaWeiboButton"
        
        static let FacebookButtonTitle = "Facebook"
        static let FacebookButtonTitleColor = UIColor.whiteColor()
        static let FacebookButtonBackgroundColor = UIColor(red: 0.1967, green: 0.2967, blue: 0.5067, alpha: 1)
        static let FacebookButtonSelector = "clickFacebookButton"

        static let GoogleButtonTitle = "Google"
        static let GoogleButtonTitleColor = UIColor.whiteColor()
        static let GoogleButtonBackgroundColor = UIColor.redColor()
        static let GoogleButtonSelector = "clickGoogleButton"
        
        static let MoreOptionsButtonTitle = "更多选项..."
        static let FewerOptionsButtonTitle = "更少选项..."
        static let OptionsButtonTitleColor = UIColor.grayColor()
        static let OptionsButtonSelector = "clickOptionsButton"
        
        static let EmailSignupLabelText = "或用邮箱注册："
        static let EmailSignupLabelTextColor = UIColor.whiteColor()
        
        static let EmailTextFieldPlaceholder = "电子邮件"
        static let EmailTextFieldBackgroundColor = UIColor.whiteColor()
     }
}