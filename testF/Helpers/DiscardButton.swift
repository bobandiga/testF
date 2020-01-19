//
//  DiscardButton.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import UIKit

@objc protocol DiscardProtocol {
    func discardAction(_ sender: UIButton)
}

class DiscardButton: UIBarButtonItem{
    
    init(delegate: DiscardProtocol, vc: UIViewController) {
        let button = UIButton(type: .custom)
        super.init()
        
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .disabled)
        button.setTitle(Constants.Localize.Button.discard, for: .normal)
        button.addTarget(vc, action: #selector(delegate.discardAction(_ :)), for: .touchUpInside)
        
        customView = button
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
