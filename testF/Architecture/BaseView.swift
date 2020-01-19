//
//  baseView.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

protocol BaseView where Self: UIViewController{
    static var storyboardName: String { get }
}


