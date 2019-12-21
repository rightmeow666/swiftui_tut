//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by sudofluff on 12/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
  static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
  
  var body: some View {
    GeometryReader { g in
      Path { p in
        let width = min(g.size.width, g.size.height)
        let height = width * 0.75
        let spacing = width * 0.030
        let middle = width / 2
        let topWidth = 0.226 * width
        let topHeight = 0.488 * height
        
        p.addLines([
          CGPoint(x: middle, y: spacing),
          CGPoint(x: middle - topWidth, y: topHeight - spacing),
          CGPoint(x: middle, y: topHeight / 2 + spacing),
          CGPoint(x: middle + topWidth, y: topHeight - spacing),
          CGPoint(x: middle, y: spacing)
        ])
        
        p.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
        p.addLines([
          CGPoint(x: middle - topWidth, y: topHeight + spacing),
          CGPoint(x: spacing, y: height - spacing),
          CGPoint(x: width - spacing, y: height - spacing),
          CGPoint(x: middle + topWidth, y: topHeight + spacing),
          CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
        ])
      }
      .fill(Self.symbolColor)
    }
  }
}

struct BadgeSymbol_Previews: PreviewProvider {
  static var previews: some View {
    BadgeSymbol()
  }
}
