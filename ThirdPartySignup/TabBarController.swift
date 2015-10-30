//
//  TabBarController.swift
//  11bnb.demo
//
//  Created by Xinxing Jiang on 10/19/15.
//  Copyright © 2015 iosjjj. All rights reserved.
//

/**
    This tab bar controller is the main page after sign in.
    For simplicity, we will have two tabs: people search, and inbox.
    People search is the place we can search people based on their names.
    You can leave someone a message after finding him/her.
    Inbox is the place we can see all messages send to us.
*/

import UIKit

class TabBarController: UITabBarController {

    // MARK: - VC life cycles
    
    override func loadView() {
        super.loadView()
        
        // setup tab bars
//        let peopleSearchController = PeopleSearchController()
//        peopleSearchController.tabBarItem = UITabBarItem(title: Constants.PeopleSearchTabBarItemTitle, image: nil, tag: 0)
//        let inboxController = InboxController()
//        inboxController.tabBarItem  = UITabBarItem(title: Constants.InboxTabBarItemTitle, image: nil, tag: 1)
//        self.viewControllers = [peopleSearchController, inboxController]
//
//        // default to first tab bar
//        self.selectedIndex = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide navigation bar
        hideNavigationBar = true
    }

    // MARK: - Constants
    
    struct Constants {
        static let PeopleSearchTabBarItemTitle = "搜索"
        
        static let InboxTabBarItemTitle = "消息"
    }
}
