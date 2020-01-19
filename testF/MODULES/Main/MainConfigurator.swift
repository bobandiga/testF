//
//  MainConfigurator.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class MainConfigurator{
    
    static func configModule(view: MainViewController) {
        let router = MainRouter(view: view)
        let presenter = MainPresenter(view: view, router: router)
        
        view.presenter = presenter
    }
}
