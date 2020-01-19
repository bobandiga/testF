//
//  BaseRouter.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

protocol BaseRouter {
  var view: UIViewController? { get }

  func back()
  func toScreen<T: BaseView>(_ type: T.Type)
}

extension BaseRouter {
  func back() {
    view?.navigationController?.popViewController(animated: true)
  }

  func toScreen<T: BaseView>(_ : T.Type) {
    guard let controller = T.instantiate(from: T.storyboardName) else { return }
    view?.show(controller, sender: self)
  }
}
