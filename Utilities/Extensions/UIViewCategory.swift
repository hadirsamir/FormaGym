//
//  UIViewCategory.swift
//  EstateRus
//
//  Created by Yahia El-Dow on 5/24/17.
//  Copyright © 2017 Production Code. All rights reserved.
//

import UIKit
extension UIView {
    
    /**
     * How To Use =>
        UIView().loadXIB(xibFileName: "XIB FILE NAME")
     */
    func loadXIB(xibFileName : String) -> UIView {
        let xibView = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?.first as! UIView
        return xibView
    }
    
    
    
    /**
     *need three paramter
     1- radiusNumber Float Number
     2- CG Color EX:(UIColor.red.cgColor)
     3- Boarder Width Float Number
     */
    func setRoundedView( radiusNumber : CGFloat = 2 , borderColor : CGColor = UIColor.white.cgColor , borderWidth  : CGFloat = 3.0) {
        
        let radius = self.frame.width / radiusNumber
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
         self.clipsToBounds = true
         self.layer.borderColor = borderColor
         self.layer.borderWidth = borderWidth
 
        
    }
    
    
    func setBorder (borderWidth : CGFloat = 1.5 , borderColor : UIColor = UIColor.gray){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
    }
}


