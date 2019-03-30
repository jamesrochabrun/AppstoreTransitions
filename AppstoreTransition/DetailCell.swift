//
//  DetailCell.swift
//  AppstoreTransition
//
//  Created by James Rochabrun on 3/30/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    static let height: CGFloat = 450.0
    
    let imageView: UIImageView = {
        let iV = UIImageView()
        iV.image = #imageLiteral(resourceName: "donut")
        iV.contentMode = .scaleAspectFill
        iV.translatesAutoresizingMaskIntoConstraints = false
        return iV
    }()
    
    let topLabel: UILabel = {
        let l  = UILabel()
        l.text = "Donut time"
        l.font = UIFont.systemFont(ofSize: 22)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let mediumLabel: UILabel = {
        let l  = UILabel()
        l.text = "Best Places to eat Donuts!"
        l.font = UIFont.systemFont(ofSize: 19)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let bottomLabel: UILabel = {
        let l  = UILabel()
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 14)
        l.text = "The best place in yhe world to eat donuts is bla bla, you sould go!"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    static let cellId = String(describing: DetailCell.self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        
        backgroundColor = #colorLiteral(red: 1, green: 0.9428719878, blue: 0.4756966233, alpha: 1)
        clipsToBounds = true
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 175),
            imageView.heightAnchor.constraint(equalToConstant: 175),
            ])
        
        let subViews = [topLabel, mediumLabel, imageContainerView, bottomLabel]
        let stackview = UIStackView(arrangedSubviews: subViews)
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 8.0
        
        contentView.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
    }
}
