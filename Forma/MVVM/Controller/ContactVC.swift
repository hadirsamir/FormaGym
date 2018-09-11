//
//  ContactVC.swift
//  Forma
//
//  Created by mac on 7/2/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    @IBOutlet weak var gym_image: UIImageView!
    @IBOutlet weak var contact_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding round corners to an image
       //gym_image.setRoundedView()
        // adding roundCorners to a label
        contact_label.layer.cornerRadius = 20
        contact_label.layer.masksToBounds = true
        
        // adding round corners to image view
        
        gym_image.layer.cornerRadius = gym_image.frame.size.width/2
        gym_image.clipsToBounds = true
        
    }
    @IBAction func contacts_back_btn(_ sender: Any) {
           self.dismiss(animated: true, completion: nil) 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
