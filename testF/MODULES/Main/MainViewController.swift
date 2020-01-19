//
//  ViewController.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: -
    var presenter: MainPresenterProtocol?
    @IBOutlet var filtersLabel: [MainLabel]!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var authLabel: UILabel!
    
    //MARK: - view load
    override func viewDidLoad() {
        super.viewDidLoad()
        MainConfigurator.configModule(view: self)
        updateBtn.setTitle(Constants.Localize.Button.update, for: .normal)
        authLabel.text = Constants.Localize.Label.author
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        presenter?.viewWillAppear()
    }
    
    //MARK: - actions
    @IBAction func updateAction(_ sender: UIButton) {
        presenter?.presentFilters()
    }
    
}

//MARK: - MainViewProtocol implementation
extension MainViewController: MainViewProtocol{
    func updateFiltersLabels(with models: [FilterViewModel]) {
        for (index, value) in models.enumerated(){
            filtersLabel[index].text = value.stringValue()
        }
    }
    
    static var storyboardName: String {
        return "Main"
    }
}

