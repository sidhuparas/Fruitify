//
//  Utils.swift
//  Fruitify
//
//  Created by Paras Sidhu on 07/07/21.
//

import Foundation
import SwiftUI

struct Utils {

    static func getFruitGradient(fruit: FruitData) -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(
                colors: [
                    hexStringToUIColor(hex: fruit.color1),
                    hexStringToUIColor(hex: fruit.color2)
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
