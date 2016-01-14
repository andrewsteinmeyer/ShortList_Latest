//
//  ViewController.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 12/14/15.
//  Copyright © 2015 Andrew Steinmeyer. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
  case Home = 0
  case Lists
  case Venues
  case Events
  case Contacts
  case SignOut
}

protocol LeftMenuProtocol : class {
  func changeViewController(menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
  
  @IBOutlet weak var tableView: UITableView!
  var menus = ["Home", "Lists", "Venues", "Events", "Contacts", "Signout"]
  var icons = ["ic_home", "ic_lists", "ic_venues", "ic_events", "ic_contacts", "user_icon"]
  var homeViewController: UIViewController!
  var listsTabBarController: UIViewController!
  var contactsViewController: UIViewController!
  var venuesViewController: UIViewController!
  var eventsViewController: UIViewController!
  var imageHeaderView: ImageHeaderView!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let user = AccountManager.defaultAccountManager.currentUser {
      imageHeaderView.emailLabel.text = user.emailAddress
    }
    
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.registerCellNib(MenuTableViewCell.self)
    self.tableView.separatorColor = UIColor.clearColor()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
    self.homeViewController = UINavigationController(rootViewController: homeViewController)
    
    let listsTabBarController = storyboard.instantiateViewControllerWithIdentifier("ListsTabBarController") as! ListsTabBarController
    self.listsTabBarController = listsTabBarController
    
    let contactsNavigationViewController = storyboard.instantiateViewControllerWithIdentifier("ContactsNavigationViewController") as! ContactsNavigationViewController
    self.contactsViewController = contactsNavigationViewController
    
    let venuesNavigationViewController = storyboard.instantiateViewControllerWithIdentifier("VenuesNavigationViewController") as! VenuesNavigationViewController
    self.venuesViewController = venuesNavigationViewController
    
    let eventsNavigationViewController = storyboard.instantiateViewControllerWithIdentifier("EventsNavigationViewController") as! EventsNavigationViewController
    self.eventsViewController = eventsNavigationViewController
    
    
    self.imageHeaderView = ImageHeaderView.loadNib()
    self.view.addSubview(self.imageHeaderView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
    self.view.layoutIfNeeded()
  }
  
  func changeViewController(menu: LeftMenu) {
    switch menu {
    case .Home:
      self.slideMenuController()?.changeMainViewController(self.homeViewController, close: true)
    case .Lists:
      self.slideMenuController()?.changeMainViewController(self.listsTabBarController, close: true)
    case .Contacts:
      self.slideMenuController()?.changeMainViewController(self.contactsViewController, close: true)
    case .Venues:
      self.slideMenuController()?.changeMainViewController(self.venuesViewController, close: true)
    case .Events:
      self.slideMenuController()?.changeMainViewController(self.eventsViewController, close: true)
    case .SignOut:
      closeLeft()
      signOut()
    }
  }
  
  func signOut() {
    AccountManager.defaultAccountManager.signOut()
  }
  
  
}

extension LeftViewController : UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if let menu = LeftMenu(rawValue: indexPath.item) {
      switch menu {
      case .Home, .Lists, .Venues, .Events, .Contacts, .SignOut:
        return MenuTableViewCell.height()
      }
    }
    return 0
  }
}

extension LeftViewController : UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menus.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    if let menu = LeftMenu(rawValue: indexPath.item) {
      switch menu {
      case .Home, .Lists, .Venues, .Events, .Contacts, .SignOut:
        let cell = self.tableView.dequeueReusableCellWithIdentifier(MenuTableViewCell.identifier) as! MenuTableViewCell
        let data = MenuTableViewCellData(imageUrl: icons[indexPath.row], text: menus[indexPath.row])
        cell.setData(data)
        return cell
      }
    }
    return UITableViewCell()
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let menu = LeftMenu(rawValue: indexPath.item) {
      self.changeViewController(menu)
    }
  }
}

extension LeftViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    if self.tableView == scrollView {
      
    }
  }
}