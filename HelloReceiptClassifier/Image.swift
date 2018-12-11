//
//  Image.swift
//  HelloReceiptClassifier
//
//  Created by i847268 on 10/22/18.
//  Copyright © 2018 Vijay. All rights reserved.
//

import Foundation
// MARK: - Image

struct Image {
    
    // MARK: Properties
    
    let imageName: String
    static let ImageNameKey = "ImageNameKey"
    
    // MARK: Initializer
    // Generate a Image from the dictionary
    
    init(dictionary: [String : String]) {
        self.imageName = dictionary[Image.ImageNameKey]!
    }
}

// MARK: - Image (All Images)

/**
 * This extension adds static variable allImages. An array of Image objects
 */

extension Image {
    
    // Generate an array full of all of the Images in
    static var allImages: [Image] {
        
        var imageArray = [Image]()
        
        for d in Image.localImageData() {
            imageArray.append(Image(dictionary: d))
        }
        
        return imageArray
    }
    
    static func localImageData() -> [[String : String]] {
        return [
            [Image.ImageNameKey : "1"],
            [Image.ImageNameKey : "2"],
            [Image.ImageNameKey : "3"],
            [Image.ImageNameKey : "4"],
            [Image.ImageNameKey : "5"],
            [Image.ImageNameKey : "6"],
            [Image.ImageNameKey : "7"],
            [Image.ImageNameKey : "8"],
            [Image.ImageNameKey : "9"],
            [Image.ImageNameKey : "10"],
            [Image.ImageNameKey : "11"],
            [Image.ImageNameKey : "12"],
            [Image.ImageNameKey : "13"],
            [Image.ImageNameKey : "14"],
            [Image.ImageNameKey : "15"],
            [Image.ImageNameKey : "16"],
            [Image.ImageNameKey : "17"],
            [Image.ImageNameKey : "18"],
            [Image.ImageNameKey : "19"],
            [Image.ImageNameKey : "20"],
            [Image.ImageNameKey : "21"],
            [Image.ImageNameKey : "22"],
            [Image.ImageNameKey : "23"],
            [Image.ImageNameKey : "24"],
            [Image.ImageNameKey : "25"],
            [Image.ImageNameKey : "26"],
            [Image.ImageNameKey : "27"],
            [Image.ImageNameKey : "28"],
            [Image.ImageNameKey : "29"],
            [Image.ImageNameKey : "30"],
            [Image.ImageNameKey : "31"],
            [Image.ImageNameKey : "32"],
        ]
    }
}

