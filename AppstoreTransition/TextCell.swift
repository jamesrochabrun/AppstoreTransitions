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
    
    let mediumLabel: UILabel = {
        let l  = UILabel()
        l.font = UIFont.systemFont(ofSize: 19)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mediumLabel)
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            mediumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            mediumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            mediumLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            mediumLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(_ model: ItemText) {
        mediumLabel.text = model.text + "\n\n" + model.SubTitle
    }
}
