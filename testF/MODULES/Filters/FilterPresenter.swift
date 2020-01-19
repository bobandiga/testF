//
//  FilterPresenter.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

//Protocols
protocol FilterViewProtocol: BaseView {
    
}

protocol FilterPresenterProtocol {
    func presentMain()
    func accept()
    func discard()
}

protocol FilterRouterProtocol: BaseRouter {
    func showMain()
}
//---

class FilterPresenter{
    private weak var view: FilterViewProtocol?
    private var router: FilterRouterProtocol
    private var filtersTableViewController: FiltersTableView
    
    init(view: FilterViewProtocol, router: FilterRouterProtocol, filtersTableViewController: FiltersTableView) {
        self.view = view
        self.router = router
        self.filtersTableViewController = filtersTableViewController
    }
}

extension FilterPresenter: FilterPresenterProtocol{
    func discard() {
        Storage.shared.toDefaultValue()
        filtersTableViewController.reload()
    }
    
    func accept() {
        Storage.shared.saveToUD()
        router.showMain()
    }
    
    func presentMain() {
        router.showMain()
    }
    
}
