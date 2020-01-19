//
//  UDKey.swift
//  testF
//
//  Created by Максим Шаптала on 19.01.2020.
//  Copyright © 2020 Максим Шаптала. All rights reserved.
//

import Foundation

enum Constants{
    enum Localize{
        enum Button{
            static let accept = NSLocalizedString("Button.Accept", comment: "")
            static let discard = NSLocalizedString("Button.Discard", comment: "")
            static let update = NSLocalizedString("Button.Update", comment: "")
            static let back = NSLocalizedString("Button.Back", comment: "")
        }
        
        enum Label{
            static let filters = NSLocalizedString("Label.Filters", comment: "")
            static let author = NSLocalizedString("Label.Author", comment: "")
            
            static let range = NSLocalizedString("Label.Range", comment: "")
            static let rangeBigger = NSLocalizedString("Label.BiggerThen", comment: "")
            static let night = NSLocalizedString("Label.Night", comment: "")
            static let nights = NSLocalizedString("Label.Nights", comment: "")
        }
    }
}

enum UDKeys{
    enum f1{
        static let min = "Filter1Min"
        static let max = "Filter1Max"
        enum def{
            static let min = "Def1Min"
            static let max = "Def1Max"
        }
    }
    enum f2{
        static let min = "Filter2Min"
        static let max = "Filter2Max"
        enum def{
            static let min = "Def2Min"
            static let max = "Def2Max"
        }
    }
    enum f3{
        static let min = "Filter3Min"
        static let max = "Filter3Max"
        enum def{
            static let min = "Def3Min"
            static let max = "Def3Max"
        }
    }
    enum f4{
        static let min = "Filter4Min"
        static let max = "Filter4Max"
        enum def{
            static let min = "Def4Min"
            static let max = "Def4Max"
        }
    }
}
