//
//  FiltersViewController.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController{
    
    //MARK: -
    @IBOutlet var filtersTableView: FiltersTableView!
    var presenter: FilterPresenterProtocol?
    private var discardButton: DiscardButton!
    //MARK: - view load
    override func viewDidLoad() {
        FiltersConfigurator.configModule(view: self)
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        discardButton.isEnabled = false
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - private
    private func setupNavBar(){
        discardButton = DiscardButton(delegate: self, vc: self)
        
        navigationItem.title = Constants.Localize.Label.filters
        navigationItem.rightBarButtonItem = discardButton
    }
    
    //MARK: - action
    @IBAction func acceptAction(_ sender: AcceptButton) {
        presenter?.accept()
    }
    
}

//MARK: - DiscardProtocol implementation
extension FiltersViewController: DiscardProtocol{
    func discardAction(_ sender: UIButton) {
        presenter?.discard()
    }
    
}

//MARK: - FilterViewProtocol implementation
extension FiltersViewController: FilterViewProtocol{
    static var storyboardName: String {
        return "Filters"
    }
}

//MARK: - Detect is filters update
extension FiltersViewController: DetectUpdate{
    func detectUpdate(isUpdate: Bool) {
        discardButton.isEnabled = isUpdate
    }
    
}
