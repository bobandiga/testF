//
//  FiltersConfigurator.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

class FiltersConfigurator{
    static func configModule(view: FiltersViewController) {
        let router = FilterRouter(view: view)
        let presenter = FilterPresenter(view: view, router: router, filtersTableViewController: view.filtersTableView)
        
        view.presenter = presenter
        view.filtersTableView.setup()
        Storage.shared.observerDelegate = view
    }
}
