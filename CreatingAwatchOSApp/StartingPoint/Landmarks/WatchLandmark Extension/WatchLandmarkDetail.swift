//
//  WatchLandmarkDetail.swift
//  WatchLandmark Extension
//
//  Created by sudofluff on 12/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
  @EnvironmentObject var userData: UserData
  
  var landmark: Landmark
  
  var landmarkIndex: Int {
    self.userData.landmarks.firstIndex(where: { $0.id == self.landmark.id })!
  }
  var body: some View {
    ScrollView {
      VStack {
        CircleImage(image: self.landmark.image.resizable())
          .scaledToFit()
        
        Text(self.landmark.name)
          .font(.headline)
          .lineLimit(0)
        
        Toggle(isOn: self.$userData.landmarks[self.landmarkIndex].isFavorite) {
          Text("Favorite")
        }
        
        Divider()
        
        Text(self.landmark.park)
          .font(.caption)
          .bold()
          .lineLimit(0)
        
        Text(self.landmark.state)
          .font(.caption)
        
        Divider()
        
        WatchMapView(landmark: self.landmark)
          .scaledToFit()
          .padding()
      }
      .padding(16)
    }
    .navigationBarTitle("Landmark")
  }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    let userData = UserData()
    return Group {
      WatchLandmarkDetail(landmark: userData.landmarks[0])
        .previewDevice("Apple Watch Series 4 - 44mm")
        .environmentObject(userData)
      
      WatchLandmarkDetail(landmark: userData.landmarks[0])
        .previewDevice("Apple Watch Series 2 - 38mm")
        .environmentObject(userData)
    }
  }
}
