//
//  FiltersTableView.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

protocol CellProtocol {
    func slideValues(model: FilterModel)
}

class FiltersTableView: NSObject{
    @IBOutlet private weak var tableView: UITableView!
    
    var filters : [FilterModel] = []
    
    func reload(){
        tableView.reloadData()
    }
    
    func setup(){
        tableView.register(UINib(nibName: "Filter", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        
        filters = Storage.shared.getFilters()
        filters.sort(by: {$0.index < $1.index})
        
        
        reload()
    }
}

//MARK: - UITableViewDataSource
extension FiltersTableView: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FilterCell
        let filter = filters[indexPath.section]
        cell.setup(model: filter, tableViewDelegate: self)
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate
extension FiltersTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "    \(filters[section].index)"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }
    
}

//MARK: - CellProtocol
extension FiltersTableView: CellProtocol{
    func slideValues(model: FilterModel) {
        if let index = filters.firstIndex(where: {$0.index == model.index}){
           filters[index] = model
        }
    }
}
