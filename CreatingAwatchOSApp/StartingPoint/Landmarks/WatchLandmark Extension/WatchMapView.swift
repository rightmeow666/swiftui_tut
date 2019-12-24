//
//  WatchMapView.swift
//  WatchLandmark Extension
//
//  Created by sudofluff on 12/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
  typealias WKInterfaceObjectType = WKInterfaceMap
  
  var landmark: Landmark
  
  func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WatchMapView.WKInterfaceObjectType {
    return WKInterfaceMap()
  }
  
  func updateWKInterfaceObject(_ wkInterfaceObject: WatchMapView.WKInterfaceObjectType, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
    let span = MKCoordinateSpan(latitudeDelta: 0.02,
        longitudeDelta: 0.02)
    let region = MKCoordinateRegion(
        center: landmark.locationCoordinate,
        span: span)
    wkInterfaceObject.setRegion(region)
  }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
      WatchMapView(landmark: UserData().landmarks[0])
    }
}
