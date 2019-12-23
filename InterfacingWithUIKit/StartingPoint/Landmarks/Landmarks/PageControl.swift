//
//  PageControl.swift
//  Landmarks
//
//  Created by sudofluff on 12/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
  typealias UIViewType = UIPageControl
  
  var numberOfPages: Int
  
  @Binding var currentPage: Int
  
  func makeUIView(context: UIViewRepresentableContext<PageControl>) -> PageControl.UIViewType {
    let control = UIPageControl()
    control.numberOfPages = self.numberOfPages
    control.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged)
    return control
  }
  
  func updateUIView(_ uiView: PageControl.UIViewType, context: UIViewRepresentableContext<PageControl>) {
    uiView.currentPage = self.currentPage
  }
  
  func makeCoordinator() -> PageControl.Coordinator {
    return Coordinator(self)
  }
  
  class Coordinator: NSObject {
    var control: PageControl
    
    init(_ control: PageControl) {
      self.control = control
    }
    
    
    @objc func updateCurrentPage(sender: UIPageControl) {
      control.currentPage = sender.currentPage
    }
  }
}
