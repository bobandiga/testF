//
//  FilterModel.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

struct FilterModel {
    var index: Int
    var min: Int
    var max: Int
    
    init(index: Int, min: CGFloat, max: CGFloat) {
        self.index = index
        self.min = Int(min)
        self.max = Int(max)
    }
    
    init(index: Int, min: Int, max: Int) {
        self.index = index
        self.min = min
        self.max = max
    }
    
}



