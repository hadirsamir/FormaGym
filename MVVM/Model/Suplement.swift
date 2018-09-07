//
//  Suplement.swift
//  Forma
//
//  Created by Mac on 6/23/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import Foundation
class Supplement{
    var sup_name:String?
    var sup_id:Int?
    var sup_description:String?
    var sup_price:Double?
    var sup_quantity:Int?
    var sup_image:String?
    
    
    init(sup_name:String,sup_id:Int,sup_description:String,sup_price:Double,sup_quantity:Int,sup_image:String){
        self.sup_name=sup_name
        self.sup_id=sup_id
        self.sup_description=sup_description
        self.sup_price=sup_price
        self.sup_quantity=sup_quantity
        self.sup_image=sup_image
        
    }
}
