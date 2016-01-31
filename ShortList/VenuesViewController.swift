//
//  VenuesViewController.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 12/24/15.
//  Copyright © 2015 Andrew Steinmeyer. All rights reserved.
//

import Foundation

import UIKit
import CoreData
import Meteor

class VenuesViewController: FetchedResultsTableViewController {
  typealias NamedValues = [String:AnyObject]
  
  @IBOutlet weak var menuButton: UIBarButtonItem!
  
  private let subscriptionName = "PrivateVenues"
  private let modelName = "Venue"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.managedObjectContext = Meteor.mainQueueManagedObjectContext
    
    if self.revealViewController() != nil {
      menuButton.target = self.revealViewController()
      menuButton.action = "revealToggle:"
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
  }
  
  // MARK: - Content Loading
  
  override func configureSubscriptionLoader(subscriptionLoader: SubscriptionLoader) {
    subscriptionLoader.addSubscriptionWithName(subscriptionName)
  }
  
  override func createFetchedResultsController() -> NSFetchedResultsController? {
    let fetchRequest = NSFetchRequest(entityName: modelName)
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "insertedOn", ascending: false)]
    
    return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
  }
  
  // MARK: - FetchedResultsTableViewDataSourceDelegate
  
  func dataSource(dataSource: FetchedResultsTableViewDataSource, configureCell cell: UITableViewCell, forObject object: NSManagedObject, atIndexPath indexPath: NSIndexPath) {
    if let venue = object as? Venue {
      if let cell = cell as? VenuesTableViewCell {
        if let location = venue.valueForKey("location") as? NamedValues? {
          let data = VenuesTableViewCellData(name: venue.name, location: location)
          cell.setData(data)
        }
        else {
          let data = VenuesTableViewCellData(name: venue.name, location: nil)
          cell.setData(data)
        }
      }
    }
  }
  
  func dataSource(dataSource: FetchedResultsTableViewDataSource, deleteObject object: NSManagedObject, atIndexPath indexPath: NSIndexPath) {
    guard let venue = object as? Venue else {
      return
    }
    
    // get documentID for venue
    let documentID = Meteor.documentKeyForObjectID(venue.objectID).documentID
    
    // delete venue
    MeteorVenueService.sharedInstance.delete([documentID]) {
      result, error in
      
      if error != nil {
        print("error: \(error?.localizedDescription)")
      } else {
        print("success: venue deleted")
      }
    }
  }

}
  