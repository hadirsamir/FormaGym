//
//  DetailsVC.swift
//  Forma
//
//  Created by mac on 7/2/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var details_text: UITextView!
    @IBOutlet weak var details_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // adding roundCorners to a label
        details_label.layer.cornerRadius = 25
        details_label.layer.masksToBounds = true

    }
    
    @IBAction func details_action_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)    }
    
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
