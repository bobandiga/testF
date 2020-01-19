//
//  MainRouter.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class MainRouter{
    
    private weak var _view: MainViewController?
    
    init(view: MainViewController) {
        self._view = view
    }
}

extension MainRouter: MainRouterProtocol{
    var view: UIViewController? {
        return _view
    }
    
    
    func showFilters() {
        toScreen(FiltersViewController.self)
    }
    
}
