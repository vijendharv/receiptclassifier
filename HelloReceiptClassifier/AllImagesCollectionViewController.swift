//
//  AllImagesCollectionView.swift
//  HelloReceiptClassifier
//
//  Created by i847268 on 10/22/18.
//  Copyright © 2018 Vijay. All rights reserved.
//

import UIKit

class AllImagesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let allImages = Image.allImages
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let image = self.allImages[indexPath.row]
        
        cell.imageView.image = UIImage(named: image.imageName)
        
        return cell
    }
    


}
