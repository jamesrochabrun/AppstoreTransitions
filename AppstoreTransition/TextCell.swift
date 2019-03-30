//
//  TextCell.swift
//  AppstoreTransition
//
//  Created by James Rochabrun on 3/30/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

class TextCell: UICollectionViewCell {
    
    static let cellId = String(describing: TextCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
