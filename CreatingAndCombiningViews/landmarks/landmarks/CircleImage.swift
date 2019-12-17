//
//  CircleImage.swift
//  landmarks
//
//  Created by sudofluff on 12/16/19.
//  Copyright © 2019 sudofluff. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
  var body: some View {
    Image("turtlerock")
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 10)
  }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
