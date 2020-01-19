//
//  MainPresenter.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

//Protocols
protocol MainViewProtocol: BaseView {
    func updateFiltersLabels(with models: [FilterViewModel])
}

protocol MainPresenterProtocol {
    func presentFilters()
    func viewWillAppear()
}

protocol MainRouterProtocol: BaseRouter {
    func showFilters()
}
//---

class MainPresenter{
    private weak var view: MainViewProtocol?
    private var router: MainRouterProtocol
    
    init(view: MainViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol{
    func viewWillAppear() {
        let models = Storage.shared.getViewFilterModels()
        view?.updateFiltersLabels(with: models)
    }
    
    func presentFilters() {
        router.showFilters()
    }
    
}
