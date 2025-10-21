//
//  BeforeImagesCell.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/19/25.
//

import UIKit

class BeforeImagesCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI(){
        collectionViewSetup()
    }
    private func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: ImageCell.className, bundle: nil), forCellWithReuseIdentifier: ImageCell.className)
    }
    
    //MARK: - IBActions
    
}


// MARK: - CollectionView Delegates

extension BeforeImagesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.className, for: indexPath) as! ImageCell
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 114)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
