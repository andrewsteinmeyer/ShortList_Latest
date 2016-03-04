//
//  EventConfiguration.swift
//  ShortList
//
//  Created by Andrew Steinmeyer on 1/8/16.
//  Copyright © 2016 Andrew Steinmeyer. All rights reserved.
//

import ObjectMapper

class EventConfiguration: Mappable {
  var minimumGuests: String?
  var maximumGuests: String?
  var attendanceType: String?
  var status: String?
  
  enum Status: String {
    case On = "on"
  }
  
  enum AttendanceType: String {
    case Rank = "rank"
  }
  
  required init() {
  }
  
  required init?(_ map: Map) {
    mapping(map)
  }
  
  // Mappable
  func mapping(map: Map) {
    minimumGuests  <- map["minimumGuests"]
    maximumGuests  <- map["maximumGuests"]
    attendanceType <- map["attendanceType"]
    status         <- map["status"]
  }
}