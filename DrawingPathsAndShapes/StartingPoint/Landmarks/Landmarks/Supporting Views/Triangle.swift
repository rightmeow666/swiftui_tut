//
//  Triangle.swift
//  Landmarks
//
//  Created by sudofluff on 12/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct Triangle: View {
    var body: some View {
      GeometryReader { g in
        Path { p in
          p.move(to: CGPoint(x: 20, y: 0))
          p.addLine(to: CGPoint(x: 20, y: 220))
          p.addLine(to: CGPoint(x: 240, y: 220))
        }
      }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
    }
}
