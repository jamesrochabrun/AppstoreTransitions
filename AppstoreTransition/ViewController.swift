//
//  ViewController.swift
//  AppstoreTransition
//
//  Created by James Rochabrun on 3/30/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView?.dataSource = self
            collectionView?.delegate = self
            collectionView?.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.cellId)
        //    collectionView?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        }
    }
    
    var startingFrame: CGRect = CGRect.zero
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    var fullDetailViewController = DetailViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.cellId, for: indexPath) as! DetailCell
        cell.layer.cornerRadius = 16.0
        let item = ItemViewModel.items[indexPath.item]
        cell.configure(model: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.collectionView.bounds.width - 64, height: DetailCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let absoluteFrame = cell.absoluteCoordinate() else { return }
        let item = ItemViewModel.items[indexPath.item]
        handlePresent(absoluteFrame: absoluteFrame, item: item)
    }

    fileprivate func handlePresent(absoluteFrame: CGRect, item: Item) {
        
        startingFrame = absoluteFrame
        
        let newVC = DetailViewController()
        newVC.item = item
        let expandedVCView = newVC.view!
        expandedVCView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(expandedVCView)
        fullDetailViewController = newVC
        //  animate, here are the coordinates, expandedVCView is the view in the transition
        
        // Anchors
        topConstraint = expandedVCView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = expandedVCView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = expandedVCView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = expandedVCView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach {$0?.isActive = true }
        self.view.layoutIfNeeded()
        
        expandedVCView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        expandedVCView.layer.cornerRadius = 16.0
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func handleDismiss(gesture: UITapGestureRecognizer) {
        
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
        
            if self.fullDetailViewController.collectionView.contentOffset != CGPoint.zero {
                self.fullDetailViewController.collectionView.setContentOffset(CGPoint.zero, animated: false)
            }
            // this one is to make the status bar has the same color.
            self.fullDetailViewController.collectionView.backgroundColor = self.fullDetailViewController.view.backgroundColor
            self.fullDetailViewController.collectionView.layer.cornerRadius = 16.0
            self.topConstraint?.constant = self.startingFrame.origin.y
            self.leadingConstraint?.constant = self.startingFrame.origin.x
            self.widthConstraint?.constant = self.startingFrame.width
            self.heightConstraint?.constant = self.startingFrame.height
            self.view.layoutIfNeeded()
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
        })
    }
}

extension UICollectionViewCell {
    
    func absoluteCoordinate() -> CGRect? {
        guard let superView = superview else { return nil }
        return superView.convert(frame, to: nil)
    }
}
