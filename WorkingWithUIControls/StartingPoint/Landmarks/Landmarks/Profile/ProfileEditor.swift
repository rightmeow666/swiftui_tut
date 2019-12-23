//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by sudofluff on 12/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
  @Binding var profile: Profile
  
  var dateRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
    let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
    return min...max
  }
  
  var body: some View {
    List {
      HStack {
        Text("asjkdasd")
        Divider()
        TextField("Username", text: self.$profile.username)
      }
      
      Toggle(isOn: self.$profile.prefersNotifications) {
        Text("Enable Notifications")
      }
      
      VStack(alignment: .leading, spacing: 20) {
        Text("Seasonal Photo").bold()
        
        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
          ForEach(Profile.Season.allCases, id: \.self) { season in
            Text(season.rawValue).tag(season)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      .padding(.top)
        
      VStack(alignment: .leading, spacing: 20, content: {
        Text("Goal Date").bold()
        DatePicker(
          "Goal Date",
          selection: self.$profile.goalDate,
          in: self.dateRange,
          displayedComponents: .date)
      })
      .padding(.top)
    }
  }
}

struct ProfileEditor_Previews: PreviewProvider {
  static var previews: some View {
    ProfileEditor(profile: .constant(.default))
  }
}
