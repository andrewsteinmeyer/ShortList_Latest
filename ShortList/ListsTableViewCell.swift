//
//  ListsTableViewCell.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 12/23/15.
//  Copyright © 2015 Andrew Steinmeyer. All rights reserved.
//

import UIKit

struct ListsTableViewCellData {
  
  init(name: String?) {
    self.name = name ?? ""
  }
  var name: String?
}

class ListsTableViewCell : BaseTableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    // add a line to the bottom of the section header
    let lineLayer = CALayer()
    lineLayer.frame = CGRectMake(0, self.bounds.height - 1, self.bounds.width, 0.5)
    lineLayer.backgroundColor = UIColor.lightGrayColor().CGColor
    self.layer.addSublayer(lineLayer)
  }
  
  override func setData(data: Any?) {
    if let data = data as? ListsTableViewCellData {
      self.nameLabel.text = data.name
    }
  }
  
}
