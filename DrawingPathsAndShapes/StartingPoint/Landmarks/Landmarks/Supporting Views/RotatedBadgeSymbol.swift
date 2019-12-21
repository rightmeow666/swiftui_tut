//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by sudofluff on 12/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
  let angle: Angle
  
  var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(self.angle, anchor: .bottom)
  }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
  static var previews: some View {
    RotatedBadgeSymbol(angle: .init(degrees: 5))
  }
}
