//
//  WelcomeView.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/18/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit

class WelcomeView: UIView {
    
    // MARK: - Fields
    
    var timer: NSTimer!
    var backgroundIndex = 0
    
    // MARK: - Subviews
    
    var logoLabel: UILabel! // for simplicity, we use a label instead of image
    var signupButton: UIButton!
    var signinButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Constants.BackgroundColors[backgroundIndex]
        initSubviews()
        initTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Init timer
    
    private func initTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(Constants.TimerInterval, target: self, selector: Selector(Constants.TimerSelector), userInfo: nil, repeats: true)
    }
    
    // MARK: - Change background
    
    func changeBackground() {
        let imageIndex = (++backgroundIndex) % Constants.BackgroundCount
        UIView.transitionWithView(self, duration: Constants.TransitionDuration, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.backgroundColor = Constants.BackgroundColors[imageIndex]
            }, completion: nil)
    }
    
    // MARK: - Init subviews
    
    private func initSubviews() {
        initLogoLabel()
        initSigninButton()
        initSignupButton()
    }
    
    // MARK: - Init logo label
    
    private func initLogoLabel() {
        logoLabel = UILabel()
        logoLabel.text = Constants.LogoLabelText
        logoLabel.textAlignment = .Center
        logoLabel.textColor = Constants.LogoLabelTextColor
        logoLabel.font = logoLabel.font.fontWithSize(Constants.LogoLabelFontSize)
        self.addSubview(logoLabel)
        
        // constraints
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: logoLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let centerX = NSLayoutConstraint(item: logoLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraints([topCon, centerX])
    }
    
    // MARK: - Init sign in button
    
    private func initSigninButton() {
        signinButton = UIButton(type: .Custom)
        signinButton.setTitle(Constants.SigninButtonTitle, forState: .Normal)
        signinButton.setTitleColor(Constants.SigninButtonTitleColor, forState: .Normal)
        signinButton.backgroundColor = Constants.SigninButtonBackgroundColor
        self.addSubview(signinButton)
        
        // button action
        signinButton.addTarget(nil, action: Selector(Constants.SigninButtonSelector), forControlEvents: .TouchUpInside)
        
        // constraints
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: signinButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: signinButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let bottomCon = NSLayoutConstraint(item: signinButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, bottomCon])
    }
    
    // MARK: - Init sign up button
    
    private func initSignupButton() {
        signupButton = UIButton(type: .Custom)
        signupButton.setTitle(Constants.SignupButtonTitle, forState: .Normal)
        signupButton.setTitleColor(Constants.SignupButtonTitleColor, forState: .Normal)
        signupButton.backgroundColor = Constants.SignupButtonBackgroundColor
        self.addSubview(signupButton)
        
        // button action
        signupButton.addTarget(nil, action: Selector(Constants.SignupButtonSelector), forControlEvents: .TouchUpInside)

        // constraints
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        let leadingCon = NSLayoutConstraint(item: signupButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: ConstraintConstants.GapBetweenViews)
        let trailingCon = NSLayoutConstraint(item: signupButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        let bottomCon = NSLayoutConstraint(item: signupButton, attribute: .Bottom, relatedBy: .Equal, toItem: signinButton, attribute: .Top, multiplier: 1, constant: -ConstraintConstants.GapBetweenViews)
        self.addConstraints([leadingCon, trailingCon, bottomCon])
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundCount = 2 // total number of background images
        static let BackgroundColor1 = UIColor(patternImage: UIImage(named: "welcome1.png")!)
        static let BackgroundColor2 = UIColor(patternImage: UIImage(named: "welcome2.png")!)
        static let BackgroundColors = [BackgroundColor1, BackgroundColor2]
        
        static let TimerInterval = 5.0
        static let TimerSelector = "changeBackground"
        static let TransitionDuration = 2.0
        
        static let LogoLabelText = "Small Talk"
        static let LogoLabelTextColor = UIColor.whiteColor()
        static let LogoLabelFontSize = CGFloat(40)
        
        static let SignupButtonTitle = "创建账号"
        static let SignupButtonTitleColor = UIColor.whiteColor()
        static let SignupButtonBackgroundColor = UIColor.redColor()
        static let SignupButtonSelector = "clickSignupButton"
        
        static let SigninButtonTitle = "登录"
        static let SigninButtonTitleColor = UIColor.whiteColor()
        static let SigninButtonBackgroundColor = UIColor.grayColor()
        static let SigninButtonSelector = "clickSigninButton"
    }
}
