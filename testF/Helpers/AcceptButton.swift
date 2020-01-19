//
//  AcceptButton.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

class AcceptButton: UIButton{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
        setTitleColor(.gray, for: .disabled)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setTitle(Constants.Localize.Button.accept, for: .normal)
    }
    
}
