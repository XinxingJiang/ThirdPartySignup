//
//  WeclomeController.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/18/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    // MARK: - UI view
    
    var welcomeView: WelcomeView!
    
    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        welcomeView = WelcomeView()
        self.view.addSubview(welcomeView)
        
        // constraints
        welcomeView.frame = self.view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TO DO: debug
//        clickSigninButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar = true
    }
    
    // MARK: - Click sign up button
    
    // get called when sign up button is clicked
    func clickSignupButton() {
        // go to sign up controller
        let signupController = SignupController()
        pushViewController(viewController: signupController)
    }
    
    // MARK: - Click sign in button
    
    // get called when sign in button is clicked
    func clickSigninButton() {
        // go to sign in controller
        let signinController = SigninController()
        pushViewController(viewController: signinController)
    }
}
