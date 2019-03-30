//
//  DetailViewController.swift
//  AppstoreTransition
//
//  Created by James Rochabrun on 3/30/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var item: Item? {
        didSet {
            view.backgroundColor = item?.backgroundColor
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let cV = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.register(TextCell.self, forCellWithReuseIdentifier: TextCell.cellId)
        cV.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.cellId)
        cV.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cV.delegate = self
        cV.dataSource = self
        return cV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   collectionView.contentInsetAdjustmentBehavior = .never
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: self.collectionView.bounds.width, height: DetailCell.height)
        }
        return .init(width: self.collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.cellId, for: indexPath) as! DetailCell
            if let item = self.item {
                cell.configure(model: item)
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.cellId, for: indexPath) as! TextCell
        return cell
    }
}


