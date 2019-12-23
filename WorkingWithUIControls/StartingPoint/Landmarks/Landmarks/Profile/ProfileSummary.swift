//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by sudofluff on 12/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
  var profile: Profile
  
  static let goalFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
  }()
  
  var body: some View {
    List {
      Text(self.profile.username)
        .bold()
        .font(.title)
      
      Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
      
      Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
      
      Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
      
      VStack(alignment: .leading, spacing: 0) {
        Text("Completed Badges")
          .font(.headline)
        ScrollView {
          HStack {
            HikeBadge(name: "First hike")
            
            HikeBadge(name: "Earth day")
              .hueRotation(Angle(degrees: 90))
            
            HikeBadge(name: "Tenth hike")
              .grayscale(0.5)
              .hueRotation(Angle(degrees: 45))
          }
        }
        .frame(width: nil, height: 140, alignment: .center)
      }
      
      VStack(alignment: .leading, spacing: 0) {
        Text("Recent hike")
          .font(.headline)
        HikeView(hike: hikeData[0])
      }
    }
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSummary(profile: Profile.default)
  }
}
