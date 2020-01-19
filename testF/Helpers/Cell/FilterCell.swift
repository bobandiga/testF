//
//  FilterCell.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit
import RangeSeekSlider

class FilterCell: UITableViewCell{
    
    @IBOutlet private weak var minValue: UILabel!
    @IBOutlet private weak var maxValue: UILabel!
    @IBOutlet private weak var rangeSlider: RangeSeekSlider!
    
    private func updateLabels(with viewModel: FilterViewModel){
        minValue.text = viewModel.minValueL
        maxValue.text = viewModel.maxValueL
    }
    
    private var _model: FilterModel!
    private var _tableViewDelegate: CellProtocol!
    
    func setup(model: FilterModel, tableViewDelegate: CellProtocol){
        _model = model
        _tableViewDelegate = tableViewDelegate
        rangeSlider.delegate = self
        
        let viewModel = FilterViewModel(filter: model)
        updateLabels(with: viewModel)
        
        rangeSlider.selectedMinValue = CGFloat(model.min)
        rangeSlider.selectedMaxValue = CGFloat(model.max)
        
        rangeSlider.minValue = 1
        rangeSlider.maxValue = 30
        rangeSlider.step = _model.index == 2 ? 1 : 1
    }
    
}

extension FilterCell: RangeSeekSliderDelegate{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        _model.min = Int(minValue)
        _model.max = Int(maxValue)
        Storage.shared.updateFilter(filter: _model)
        updateLabels(with: FilterViewModel(filter: _model))
        
    }
}
