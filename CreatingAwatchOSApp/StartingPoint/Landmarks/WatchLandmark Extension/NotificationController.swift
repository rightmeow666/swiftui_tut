//
//  NotificationController.swift
//  WatchLandmark Extension
//
//  Created by sudofluff on 12/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
  var landmark: Landmark?
  
  var title: String?
  
  var message: String?
  
  let landmarkIndexKey = "landmarkIndex"
  
  override var body: NotificationView {
    return NotificationView(
      title: self.title,
      message: self.message,
      landmark: self.landmark)
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  override func didReceive(_ notification: UNNotification) {
    // This method is called when a notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    let userData = UserData()
    let notificationData = notification.request.content.userInfo as? [String: Any]
    let aps = notificationData?["aps"] as? [String: Any]
    let alert = aps?["alert"] as? [String: Any]
    
    self.title = alert?["title"] as? String
    self.message = alert?["body"] as? String
    
    if let index = notificationData?[landmarkIndexKey] as? Int {
      self.landmark = userData.landmarks[index]
    }
  }
}
