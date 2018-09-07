//
//  User.swift
//  Forma
//
//  Created by Mac on 6/23/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import Foundation
class User{
    var first_name:String?
    var last_name:String?
    var id:Int?
    var email:String?
    var password:String?
    var phone:String?
    var photo:String?
    
    init(first_name:String,last_name:String,id:Int,email:String,password:String,photo:String,phone:String){
        self.first_name=first_name
        self.last_name=last_name
        self.id=id
        self.email=email
        self.password=password
        self.photo=photo
        self.phone=phone
    }
    
    
}
