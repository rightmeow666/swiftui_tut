//
//  HikeBadge.swift
//  Landmarks
//
//  Created by sudofluff on 12/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
  var name: String
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      Badge()
        .frame(width: 300, height: 300, alignment: .center)
        .scaleEffect(1.0 / 3.0)
        .frame(width: 100, height: 100, alignment: .center)
      Text(name)
        .font(.caption)
        .accessibility(label: Text("Badge for \(self.name)."))
    }
  }
}

struct HikeBadge_Previews: PreviewProvider {
  static var previews: some View {
    HikeBadge(name: "Preview testing")
  }
}
