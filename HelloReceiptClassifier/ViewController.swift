//
//  ViewController.swift
//  HelloReceiptClassifier
//
//  Created by i847268 on 10/22/18.
//  Copyright © 2018 Vijay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    
    let model = ReceiptsClassifier();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func caption(image:CVPixelBuffer) throws -> String{
        let prediction = try model.prediction(image: image)
        return prediction.classLabel
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        updateClassifications(for: image)
        
    }
    
    func updateClassifications(for image: UIImage){
        classificationLabel.text = "Classifying..."
        let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!)
        do{
            let label = try caption(image: pixelBuffer!)
            classificationLabel.text = label
            if label == "Receipt"{
                classificationLabel.textColor = UIColor(hue: 0.3167, saturation: 1, brightness: 0.61, alpha: 1.0)
            }
            else{
                classificationLabel.textColor = UIColor.red
            }
        }
        catch{
            
        }
    }

    @IBAction func takePicture(_ sender: Any) {
        // Show options for the source picker only if the camera is available.
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcePicker = UIAlertController()
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(photoSourcePicker, animated: true)
    }
    
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
}

