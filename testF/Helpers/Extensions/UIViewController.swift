//
//  UIViewController.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate<T: UIViewController>(from storyboard: String) -> T? {
    let identifier = String(describing: self)
    return UIStoryboard(name: storyboard.isEmpty ? identifier : storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T
  }

}
