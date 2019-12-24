//
//  ContentView.swift
//  WatchLandmark Extension
//
//  Created by sudofluff on 12/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    LandmarkList { WatchLandmarkDetail(landmark: $0) }
      .environmentObject(UserData())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList { WatchLandmarkDetail(landmark: $0) }
      .environmentObject(UserData())
  }
}
