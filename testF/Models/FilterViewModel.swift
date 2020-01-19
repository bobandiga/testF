//
//  FilterViewModel.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

struct FilterViewModel {
    var minValueL: String!
    var maxValueL: String!
    
    private var filterModel: FilterModel!
    
    init(filter: FilterModel) {
        filterModel = filter
    
        var minStr = Constants.Localize.Label.night
        if filter.min > 1{
            minStr = Constants.Localize.Label.nights
        }
        
        minValueL = "\(filter.min) \(minStr)"
        
        var maxStr = Constants.Localize.Label.night
        if filter.max > 1{
            maxStr = Constants.Localize.Label.nights
        }
        
        maxValueL = filter.max < 30 ? "\(filter.max) \(maxStr)" : "\(Constants.Localize.Label.rangeBigger) \(filter.max) \(maxStr)"
    }
    
    func stringValue() -> String{
        let strR = Constants.Localize.Label.range
        return "\(strR)[\(filterModel.index)] \(minValueL!) - \(maxValueL!)"
    }
}
