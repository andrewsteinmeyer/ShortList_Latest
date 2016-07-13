//
//  MainTabBarController.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 12/19/15.
//  Copyright © 2015 Andrew Steinmeyer. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tabBar.tintColor = Theme.TabBarButtonTintColor.toUIColor()
    self.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Lato-Regular", size: 5)!], forState: .Normal)
    
  }
  
}
