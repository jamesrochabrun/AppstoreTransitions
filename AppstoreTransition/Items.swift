//
//  Items.swift
//  AppstoreTransition
//
//  Created by James Rochabrun on 3/30/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

struct Item {
    
    let title: String
    let subTitle: String
    let detailTitle: String
    let image: UIImage
    let backgroundColor: UIColor
}


struct ItemViewModel {
    
    static var items: [Item] {
        return ItemViewModel.colors.map { Item(title: "Interesting title Goes here", subTitle: "Som Details here", detailTitle: "Lorem ipsum some stuff", image: #imageLiteral(resourceName: "sonut1"), backgroundColor: $0) }
    }
    
    static var colors = [#colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9758413434, green: 0.2590503693, blue: 1, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.2150729001, green: 0.961137712, blue: 1, alpha: 1)]
}
