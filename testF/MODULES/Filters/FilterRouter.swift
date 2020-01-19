//
//  FilterRouter.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class FilterRouter{
    private weak var _view: FiltersViewController?
       
       init(view: FiltersViewController) {
           self._view = view
       }
}

extension FilterRouter: FilterRouterProtocol{
    var view: UIViewController? {
        return _view
    }
    
    func showMain() {
        back()
    }
}
