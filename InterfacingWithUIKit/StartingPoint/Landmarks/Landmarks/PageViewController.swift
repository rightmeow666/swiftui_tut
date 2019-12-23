//
//  PageViewController.swift
//  Landmarks
//
//  Created by sudofluff on 12/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
  var controllers: [UIViewController]
  
  @Binding var currentPage: Int
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal,
      options: nil
    )
    pageViewController.dataSource = context.coordinator
    return pageViewController
  }
  
  func updateUIViewController(_ viewController: UIPageViewController, context: Context) {
    viewController.setViewControllers(
      [self.controllers[self.currentPage]],
      direction: .forward,
      animated: true,
      completion: nil
    )
  }
  
  func makeCoordinator() -> PageViewController.Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController) {
      self.parent = pageViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return parent.controllers.last
      }
      return parent.controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count {
        return parent.controllers.first
      }
      return parent.controllers[index + 1]
    }
  }
}
