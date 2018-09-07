//
//  UserModelView.swift
//  Forma
//
//  Created by mac on 6/24/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import Foundation
class UserModelView {
    
    // creating an instance from User Class//
    private var User_item : User
    
    // initiallizer//
init( first_name:String,last_name:String,id:Int,email:String,password:String,phone:String,photo:String)
{
self.User_item = User(first_name:first_name, last_name:last_name, id: id, email:email, password:password, photo: photo, phone: phone)
    
    }
    
    // user_item closures //
    var FirstName : String? {
        return User_item.first_name
    }
    var LastName :String? {
        return User_item.last_name
    }
    var id : Int? {
        return User_item.id
    }
    var email : String? {
        return User_item.email
    }
    var password : String? {
        return User_item.password
    }
    var photo : String?{
    return User_item.photo
    }
    var phone : String? {
        return User_item.phone
    }
}
