//
//  ReceiptCollectionViewController.swift
//  HelloReceiptClassifier
//
//  Created by i847268 on 10/22/18.
//  Copyright © 2018 Vijay. All rights reserved.
//

import UIKit

class ReceiptCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let allImages = Image.allImages
    let model = ReceiptsClassifier();
    
    var receiptImages: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        for image in allImages {
            let imageData = UIImage(named: image.imageName);
            let pixelBuffer = ImageProcessor.pixelBuffer(forImage: imageData!.cgImage!)
            do{
                let label = try caption(image: pixelBuffer!)
                if label == "Receipt"{
                    receiptImages.append(image)
                }
            }
            catch{
                
            }
        }
    }
    
    func caption(image:CVPixelBuffer) throws -> String{
        let prediction = try model.prediction(image: image)
        return prediction.classLabel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.receiptImages.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "receiptCollectionViewCell", for: indexPath) as! ReceiptCollectionViewCell
        let image = self.receiptImages[indexPath.row]
        
        cell.imageView.image = UIImage(named: image.imageName)
        
        return cell
    }
}
