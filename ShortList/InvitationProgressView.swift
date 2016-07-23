//
//  InvitationProgressView.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 7/20/16.
//  Copyright © 2016 Andrew Steinmeyer. All rights reserved.
//

import UIKit

class InvitationProgressView: UIView {
  
  let buttonRatioToView: CGFloat      = 0.6
  let buttonImageRatioToView: CGFloat = 0.4
  let buttonBorderWidth: CGFloat      = 0.5
  let buttonCornerRadius: CGFloat     = 3.0
  let progressViewHeight: CGFloat     = 0.25
  
  var buttonsArray = [UIButton]()
  var progressView: UIProgressView!
  
  enum ButtonType: Int {
    case Settings
    case Details
    case Send
  }
  
  enum Progress: Float {
    case Settings = 0
    case Details  = 0.5
    case Send     = 1.0
  }
  
  private var firstTime = true
  
  //MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.whiteColor()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.backgroundColor = UIColor.whiteColor()
  }
  
  //MARK: - View layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupProgressBar()
    layoutButtons()
  }
  
  private func setupProgressBar() {
    let width = bounds.size.width
    let yCenter = self.center.y
    
    //turn off autoresizing so that we can set our own constraints
    progressView = UIProgressView(frame: CGRect(x: 0, y: yCenter, width: width, height: progressViewHeight))
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.trackTintColor = UIColor.lightGrayColor()
    progressView.progressTintColor = Theme.InvitationProgressViewTintColor.toUIColor()
    self.addSubview(progressView)
    
    let margins = self.layoutMarginsGuide
    
    progressView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true
    progressView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
    progressView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
  }
  
  private func layoutButtons() {
    // settings button
    let settingsButton = UIButton(type: .Custom)
    settingsButton.translatesAutoresizingMaskIntoConstraints = false
    settingsButton.layer.borderWidth = buttonBorderWidth
    settingsButton.layer.cornerRadius = buttonCornerRadius
    settingsButton.layer.borderColor = UIColor.lightGrayColor().CGColor
    settingsButton.backgroundColor = UIColor.whiteColor()
    settingsButton.addTarget(self, action: #selector(InvitationProgressView.buttonDidPress(_:)), forControlEvents: .TouchUpInside)
    settingsButton.tag = ButtonType.Settings.rawValue
    
    let settingsImage = UIImage(named: "settings-two-cogs")?.imageWithColor(Theme.InvitationProgressButtonColor.toUIColor())
    settingsButton.setImage(settingsImage, forState: .Normal)
    self.addSubview(settingsButton)
    
    
    // details button
    let detailsButton = UIButton(type: .Custom)
    detailsButton.translatesAutoresizingMaskIntoConstraints = false
    detailsButton.layer.borderWidth = buttonBorderWidth
    detailsButton.layer.cornerRadius = buttonCornerRadius
    detailsButton.layer.borderColor = UIColor.lightGrayColor().CGColor
    detailsButton.backgroundColor = UIColor.whiteColor()
    detailsButton.addTarget(self, action: #selector(InvitationProgressView.buttonDidPress(_:)), forControlEvents: .TouchUpInside)
    detailsButton.tag = ButtonType.Details.rawValue
    
    let detailsImage = UIImage(named: "invite-details")?.imageWithColor(Theme.InvitationProgressButtonColor.toUIColor())
    detailsButton.setImage(detailsImage, forState: .Normal)
    self.addSubview(detailsButton)
    
    // send button
    let sendButton = UIButton(type: .Custom)
    sendButton.translatesAutoresizingMaskIntoConstraints = false
    sendButton.layer.borderWidth = buttonBorderWidth
    sendButton.layer.cornerRadius = buttonCornerRadius
    sendButton.layer.borderColor = UIColor.lightGrayColor().CGColor
    sendButton.backgroundColor = UIColor.whiteColor()
    sendButton.addTarget(self, action: #selector(InvitationProgressView.buttonDidPress(_:)), forControlEvents: .TouchUpInside)
    sendButton.tag = ButtonType.Send.rawValue
    
    let sendImage = UIImage(named: "invite-send")?.imageWithColor(Theme.InvitationProgressButtonColor.toUIColor())
    sendButton.setImage(sendImage, forState: .Normal)
    self.addSubview(sendButton)
    
    if firstTime {
      // select settings button
      //selectButton(settingsButton)
      firstTime = false
    }
    
    // add buttons to array
    buttonsArray = [settingsButton, detailsButton, sendButton]
    
    // add layouts for buttons
    let leadingGuide = UILayoutGuide()
    let firstBuffer = UILayoutGuide()
    let secondBuffer = UILayoutGuide()
    let trailingGuide = UILayoutGuide()
    
    self.addLayoutGuide(leadingGuide)
    self.addLayoutGuide(firstBuffer)
    self.addLayoutGuide(secondBuffer)
    self.addLayoutGuide(trailingGuide)
    
    let margins = self.layoutMarginsGuide
    
    margins.leadingAnchor.constraintEqualToAnchor(leadingGuide.leadingAnchor).active = true
    leadingGuide.trailingAnchor.constraintEqualToAnchor(settingsButton.leadingAnchor).active = true
    settingsButton.trailingAnchor.constraintEqualToAnchor(firstBuffer.leadingAnchor).active = true
    firstBuffer.trailingAnchor.constraintEqualToAnchor(detailsButton.leadingAnchor).active = true
    detailsButton.trailingAnchor.constraintEqualToAnchor(secondBuffer.leadingAnchor).active = true
    secondBuffer.trailingAnchor.constraintEqualToAnchor(sendButton.leadingAnchor).active = true
    sendButton.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
    
    // The buttons should have the same width
    settingsButton.widthAnchor.constraintEqualToAnchor(settingsButton.heightAnchor).active = true
    settingsButton.widthAnchor.constraintEqualToAnchor(detailsButton.widthAnchor).active = true
    detailsButton.widthAnchor.constraintEqualToAnchor(sendButton.widthAnchor).active = true
    
    // The guides should have the same width
    leadingGuide.widthAnchor.constraintEqualToAnchor(trailingGuide.widthAnchor).active = true
    firstBuffer.widthAnchor.constraintEqualToAnchor(secondBuffer.widthAnchor).active = true
    
    leadingGuide.heightAnchor.constraintEqualToAnchor(self.heightAnchor, multiplier: buttonRatioToView).active = true
    settingsButton.heightAnchor.constraintEqualToAnchor(leadingGuide.heightAnchor).active = true
    detailsButton.heightAnchor.constraintEqualToAnchor(settingsButton.heightAnchor).active = true
    settingsButton.heightAnchor.constraintEqualToAnchor(sendButton.heightAnchor).active = true
    
    // Center everything vertically in the super view
    leadingGuide.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    settingsButton.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    firstBuffer.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    detailsButton.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    secondBuffer.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    sendButton.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    trailingGuide.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
  }
  
  //MARK: - Button Actions
  
  func buttonDidPress(sender: UIButton) {
    toggleButtonShadows(sender)
    updateProgressBar(sender)
  }
  
  func updateProgressBar(sender: UIButton) {
    if let buttonType = ButtonType(rawValue: sender.tag) {
      switch buttonType {
      case .Settings:
        progressView.progress = Progress.Settings.rawValue
      case .Details:
        progressView.progress = Progress.Details.rawValue
      case .Send:
        progressView.progress = Progress.Send.rawValue
      }
    }
  }
  
  func toggleButtonShadows(sender: UIButton) {
    let unselectedButtons = buttonsArray.filter( { $0.tag != sender.tag } )
    
    // unselect other buttons
    for button in unselectedButtons {
      button.layer.borderWidth = buttonBorderWidth
      button.layer.shadowOpacity = 0
    }
    
    selectButton(sender)
  }
  
  func selectButton(button: UIButton) {
    // select button
    button.layer.shadowColor = UIColor.lightGrayColor().CGColor
    button.layer.shadowOpacity = 0.75
    button.layer.shadowRadius = 10
    button.layer.borderWidth = 0
    button.layer.shadowOffset = CGSizeZero
  }
  
}
