//
//  GymProfileVC.swift
//  Forma
//
//  Created by mac on 7/1/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class GymProfileVC: UIViewController {


    @IBOutlet weak var gym_view: UIView!
    @IBOutlet weak var distance_number: UILabel!
    @IBOutlet weak var rate_number: UILabel!
    @IBOutlet weak var share_btn: UIButton!
    @IBOutlet weak var member_label: UIImageView!
    @IBOutlet weak var days_label: UILabel!
    @IBOutlet weak var hours_label: UIImageView!
    @IBOutlet weak var gym_service: UILabel!
    @IBOutlet weak var gym_name: UILabel!
    @IBOutlet weak var details_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    @IBOutlet weak var gym_image: UIImageView!
    @IBOutlet weak var location_label: UILabel!
    
    @IBOutlet weak var background_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // set round corners for a btn
        contact_btn.layer.cornerRadius = 30
        details_btn.layer.cornerRadius = 30
        
       // share_btn.setRoundedView()
        //location_label.setRoundedView()
        share_btn.layer.cornerRadius = 25
        location_label.layer.cornerRadius = 20
        location_label.layer.masksToBounds = true
        
        
        
        // set round corners for a view
        gym_view.layer.cornerRadius = 40
        gym_view.layer.masksToBounds = true
        
        // adding round corners to an image
        gym_image.layer.cornerRadius = gym_image.frame.size.width/2
        gym_image.clipsToBounds = true
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
