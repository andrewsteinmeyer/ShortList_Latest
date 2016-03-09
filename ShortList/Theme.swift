//
//  Theme.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 2/2/16.
//  Copyright © 2016 Andrew Steinmeyer. All rights reserved.
//

import UIKit
import ChameleonFramework

enum Theme {
  
  private struct Palette {
    
    //static let mainThemeColor             = "F5D76E"
    static let mainThemeColor               = "FFD673"
    static let mainThemeBackgroundColor     = "303E4D"
    static let mainThemeTextColor           = "333333"
    static let mainThemeErrorColor          = "EB4D5C"
    //static let mainThemeErrorColor          = "DE495B"
    static let mainThemeButtonTextColor     = "007AFF"
    //static let mainThemeButtonTextColor     = "428BCA"
    
    static let menuTextColor                = "FFECDB"
    //static let menuIconColor              = "FCE353"  //brighter yellow
    
    static let tableCellBackgroundColor     = "FFFFFF"
    static let tableCellSelectedColor       = "4C9689"
    static let tableCellTextSelectedColor   = "FFECDB"
    static let tableCellSeparatorColor      = "AAAAAA"
    
    static let emptyDataSetTitleColor       = "C9C9C9"
    static let emptyDataSetDescriptionColor = "C9C9C9"
    
    static let eventInviteIconColor         = "4C9689"
    static let eventMessageIconColor        = "428BCA"
    static let eventAlertIconColor          = "EB4D5C"
    
    static let scannerOutlineColor          = "FFD673"
    //static let scannerOutlineColor          = "65A0D6"
  }
  
  // Base Table View Cell
  case BaseTableViewCellTextColor
  case BaseTableViewCellBackgroundColor
  case BaseTableViewCellSeparatorColor
  
  // Empty Data Set
  case EmptyDataSetTitleColor
  case EmptyDataSetDescriptionColor
  
  // Sign In
  case SignInViewBackgroundColor
  case SignInViewThemeColor
  case SignInViewErrorColor
  case SignInViewTextFieldPlaceholderColor
  
  // Navigation
  case NavigationBarTintColor
  case NavigationBarBackgroundColor
  case NavigationBarActionButtonTextColor
  
  // TabBar
  case TabBarButtonTintColor
  
  // Menu
  case MenuHeaderViewBackgroundColor
  case MenuHeaderViewTextColor
  case MenuTableViewCellBackgroundColor
  case MenuTableViewCellBackgroundSelectedColor
  case MenuTableViewCellTextColor
  case MenuTableViewCellTextSelectedColor
  case MenuTableViewIconColor
  case MenuTableViewIconSelectedColor
  
  // Contact
  case CreateContactButtonBackgroundColor
  case CreateContactButtonTextColor
  case CreateContactViewErrorColor
  
  // List
  case ContactsTableViewCellBackgroundSelectedColor
  case ContactsTableViewCellTextColor
  case ContactsTableViewCellTextSelectedColor
  case ContactsTableViewCellSeparatorSelectedColor
  case SelectContactsHeaderViewBackgroundColor
  case SelectContactsHeaderViewTextColor
  
  // Venue
  case CreateVenueButtonBackgroundColor
  case CreateVenueButtonTextColor
  case CreateVenueViewErrorColor
  
  // Event
  case CreateEventViewErrorColor
  
  // Profile
  case ProfileTableViewHeaderTextColor
  case ProfileLogoutButtonTextColor
  
  // Alert
  case AlertEventInviteIconColor
  case AlertNewMessageIconColor
  case AlertDefaultIconColor
  
  // Scan
  case QRScannerOutlineColor
  case CancelScanButtonBackgroundColor
  case CancelScanButtonTextColor
  
  func toUIColor() -> UIColor {
    switch self {
      
    // Base Table View Cell
    case .BaseTableViewCellTextColor:                    return HexColor(Palette.mainThemeTextColor)
    case .BaseTableViewCellBackgroundColor:              return HexColor(Palette.tableCellBackgroundColor)
    case .BaseTableViewCellSeparatorColor:               return HexColor(Palette.tableCellSeparatorColor)
      
    // Empty Data Set
    case .EmptyDataSetTitleColor:                        return HexColor(Palette.emptyDataSetTitleColor)
    case .EmptyDataSetDescriptionColor:                  return HexColor(Palette.emptyDataSetDescriptionColor)
    
    // Sign In
    case .SignInViewBackgroundColor:                     return HexColor(Palette.mainThemeBackgroundColor)
    case .SignInViewThemeColor:                          return HexColor(Palette.mainThemeColor)
    case .SignInViewErrorColor:                          return HexColor(Palette.mainThemeErrorColor)
    case .SignInViewTextFieldPlaceholderColor:           return HexColor(Palette.mainThemeTextColor)
      
    // Navigation
    case .NavigationBarTintColor:                        return HexColor(Palette.mainThemeTextColor)
    case .NavigationBarBackgroundColor:                  return HexColor(Palette.mainThemeColor)
    case .NavigationBarActionButtonTextColor:            return HexColor(Palette.mainThemeButtonTextColor)
    
    // TabBar
    case .TabBarButtonTintColor:                         return HexColor(Palette.mainThemeTextColor)
      
    // Menu
    case .MenuHeaderViewBackgroundColor:                 return HexColor(Palette.mainThemeBackgroundColor)
    case .MenuHeaderViewTextColor:                       return HexColor(Palette.menuTextColor)
    case .MenuTableViewCellBackgroundColor:              return HexColor(Palette.mainThemeBackgroundColor)
    case .MenuTableViewCellBackgroundSelectedColor:      return HexColor(Palette.mainThemeColor)
    case .MenuTableViewCellTextColor:                    return HexColor(Palette.menuTextColor)
    case .MenuTableViewCellTextSelectedColor:            return ContrastColorOf(Theme.MenuTableViewCellBackgroundSelectedColor.toUIColor(), returnFlat: true)
    case .MenuTableViewIconColor:                        return HexColor(Palette.mainThemeColor)
    case .MenuTableViewIconSelectedColor:                return ContrastColorOf(Theme.MenuTableViewCellBackgroundSelectedColor.toUIColor(), returnFlat: true)
      
    // Contact
    case .CreateContactButtonBackgroundColor:            return HexColor(Palette.mainThemeColor)
    case .CreateContactButtonTextColor:                  return HexColor(Palette.mainThemeTextColor)
    case .CreateContactViewErrorColor:                   return HexColor(Palette.mainThemeErrorColor)
    
    // List
    case .ContactsTableViewCellBackgroundSelectedColor:  return HexColor(Palette.tableCellSelectedColor)
    case .ContactsTableViewCellTextColor:                return HexColor(Palette.mainThemeTextColor)
    case .ContactsTableViewCellTextSelectedColor:        return HexColor(Palette.tableCellTextSelectedColor)
    case .ContactsTableViewCellSeparatorSelectedColor:   return HexColor(Palette.tableCellTextSelectedColor)
    case .SelectContactsHeaderViewBackgroundColor:       return HexColor(Palette.mainThemeColor)
    case .SelectContactsHeaderViewTextColor:             return HexColor(Palette.mainThemeTextColor)
      
    // Venue
    case .CreateVenueButtonBackgroundColor:              return HexColor(Palette.mainThemeColor)
    case .CreateVenueButtonTextColor:                    return HexColor(Palette.mainThemeTextColor)
    case .CreateVenueViewErrorColor:                     return HexColor(Palette.mainThemeErrorColor)
      
    // Event
    case .CreateEventViewErrorColor:                     return HexColor(Palette.mainThemeErrorColor)
      
    // Profile
    case .ProfileTableViewHeaderTextColor:               return HexColor(Palette.mainThemeTextColor)
    case .ProfileLogoutButtonTextColor:                  return HexColor(Palette.mainThemeErrorColor)
    
    // Alert
    case .AlertEventInviteIconColor:                     return HexColor(Palette.eventInviteIconColor)
    case .AlertNewMessageIconColor:                      return HexColor(Palette.eventMessageIconColor)
    case .AlertDefaultIconColor:                         return HexColor(Palette.eventAlertIconColor)
      
    // Scan
    case QRScannerOutlineColor:                          return HexColor(Palette.scannerOutlineColor)
    case CancelScanButtonBackgroundColor:                return HexColor(Palette.mainThemeColor)
    case CancelScanButtonTextColor:                      return HexColor(Palette.mainThemeTextColor)
    
    }
  }
}