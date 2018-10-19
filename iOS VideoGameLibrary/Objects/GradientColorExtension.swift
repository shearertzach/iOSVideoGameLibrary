//
//  GradientColorExtension.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/18/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }



    
    
}






