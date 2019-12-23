//
//  PageView.swift
//  Landmarks
//
//  Created by sudofluff on 12/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
  init(_ views: [Page]) {
    self.viewControllers = views.map { UIHostingController(rootView: $0) }
  }
  
  @State var currentPage = 0
  
  var viewControllers: [UIHostingController<Page>]
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(controllers: self.viewControllers, currentPage: self.$currentPage)
      
      PageControl(numberOfPages: self.viewControllers.count, currentPage: self.$currentPage)
        .padding(.trailing)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    PageView(features.map { FeatureCard(landmark: $0) })
  }
}
