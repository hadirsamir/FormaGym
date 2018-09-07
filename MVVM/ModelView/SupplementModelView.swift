//
//  SupplementModelView.swift
//  Forma
//
//  Created by mac on 6/24/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import Foundation
class SupplementModelView{
    
    // creating an object from supplement class //
    
    private var supp_item : Supplement
    
    // constructor//
init(sup_name:String,sup_id:Int,sup_description:String,sup_price:Double,sup_quantity:Int,sup_image:String)
        
{ self.supp_item = Supplement(sup_name: sup_name, sup_id:sup_id, sup_description: sup_description, sup_price: sup_price, sup_quantity: sup_quantity, sup_image: sup_image)
        
    }
    
    // supp_item closures
    var SuppName :String?{
        return supp_item.sup_name
    }
  
    var SuppID :Int?{
        return supp_item.sup_id
    }
    var SuppDesc :String?{
        return supp_item.sup_description
    }
    var SuppPrice :Double?{
        return supp_item.sup_price
    }
    var  SuppQuantiyt:Int?{
        return supp_item.sup_quantity
    }
    var SuppImage :String?{
        return supp_item.sup_image
    }
    
    
    
    
}
