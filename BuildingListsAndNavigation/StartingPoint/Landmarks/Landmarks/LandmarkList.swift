//
//  LandmarkList.swift
//  Landmarks
//
//  Created by sudofluff on 12/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    NavigationView {
      List(landmarkData) { x in
        NavigationLink(destination: LandmarkDetail(landmark: x)) {
          LandmarkRow(landmark: x)
        }
      }
      .navigationBarTitle(Text("Landmarks"))
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
  }
}
