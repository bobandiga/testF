//
//  Storage.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

protocol DetectUpdate {
    func detectUpdate(isUpdate: Bool)
}


class Storage{
    static let shared = Storage()
    
    init() {
        readFromUD()
        filters.sort(by: {$0.index < $1.index})
    }
    
    var observerDelegate: DetectUpdate?
    
    func getFilters() -> [FilterModel]{
        return filters
    }
    
    func toDefaultValue(){
        filters.forEach { (_model) in
            switch _model.index{
                case 1:
                filters[filters.firstIndex(where: {$0.index == 1})!].min = 1
                filters[filters.firstIndex(where: {$0.index == 1})!].max = 30
                case 2:
                filters[filters.firstIndex(where: {$0.index == 2})!].min = 1
                filters[filters.firstIndex(where: {$0.index == 2})!].max = 30
                case 3:
                filters[filters.firstIndex(where: {$0.index == 3})!].min = 18
                filters[filters.firstIndex(where: {$0.index == 3})!].max = 20
                case 4:
                filters[filters.firstIndex(where: {$0.index == 4})!].min = 7
                filters[filters.firstIndex(where: {$0.index == 4})!].max = 14
                default:
                    return
            }
        }
    }
    
    func getViewFilterModels() -> [FilterViewModel]{
        return filters.compactMap({FilterViewModel(filter: $0)})
    }
    
    func saveToUD(){
        filters.forEach({ [weak self] in
            print($0)
            let key = $0.index
            self?.saveToUD(filter: $0, key: key)
        })
    }
    
    func updateFilter(filter: FilterModel){
        if filters.contains(where: {$0.index == filter.index}){
            filters[filters.firstIndex(where: {$0.index == filter.index})!] = filter
        }else{
            filters.append(filter)
        }
    }
    
    
    //MARK: - private
    
    private var filters: [FilterModel] = []{
        didSet{
            observerDelegate?.detectUpdate(isUpdate: detectUpdate())
        }
    }
    
    private func detectUpdate() -> Bool{
        var returnedValue = false
        filters.forEach { (_model) in
            
            let index = _model.index
            
            let defMin = UserDefaults.standard.integer(forKey: "Def\(index)Min")
            let defMax = UserDefaults.standard.integer(forKey: "Def\(index)Max")
            
            if defMin != _model.min || defMax != _model.max{
                returnedValue = true
            }
        }
        return returnedValue
    }
    
    private func readFromUD(){
        let f1Min = UserDefaults.standard.integer(forKey: UDKeys.f1.min)
        let f1Max = UserDefaults.standard.integer(forKey: UDKeys.f1.max)
        let filterModel1 = FilterModel(index: 1, min: f1Min, max: f1Max)
        updateFilter(filter: filterModel1)

        let f2Min = UserDefaults.standard.integer(forKey: UDKeys.f2.min)
        let f2Max = UserDefaults.standard.integer(forKey: UDKeys.f2.max)
        let filterModel2 = FilterModel(index: 2, min: f2Min, max: f2Max)
        updateFilter(filter: filterModel2)

        let f3Min = UserDefaults.standard.integer(forKey: UDKeys.f3.min)
        let f3Max = UserDefaults.standard.integer(forKey: UDKeys.f3.max)
        let filterModel3 = FilterModel(index: 3, min: f3Min, max: f3Max)
        updateFilter(filter: filterModel3)

        let f4Min = UserDefaults.standard.integer(forKey: UDKeys.f4.min)
        let f4Max = UserDefaults.standard.integer(forKey: UDKeys.f4.max)
        let filterModel4 = FilterModel(index: 4, min: f4Min, max: f4Max)
        updateFilter(filter: filterModel4)
    }
    
    private func saveToUD(filter: FilterModel, key: Int){
        var min_key = ""
        var max_key = ""
        
        switch key {
        case 1:
            min_key = UDKeys.f1.min
            max_key = UDKeys.f1.max
        case 2:
            min_key = UDKeys.f2.min
            max_key = UDKeys.f2.max
        case 3:
            min_key = UDKeys.f3.min
            max_key = UDKeys.f3.max
        case 4:
            min_key = UDKeys.f4.min
            max_key = UDKeys.f4.max
        default:
            return
        }
        UserDefaults.standard.set(filter.max, forKey: max_key)
        UserDefaults.standard.set(filter.min, forKey: min_key)
    }
    
}
