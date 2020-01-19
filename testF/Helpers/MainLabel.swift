//
//  UILabel.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class MainLabel: UILabel{
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        font = UIFont.systemFont(ofSize: 20)
        minimumScaleFactor = 0.65
        adjustsFontSizeToFitWidth = true
        numberOfLines = 2
        backgroundColor = UIColor.lightGray
        textColor = UIColor.white
    }
    
}
