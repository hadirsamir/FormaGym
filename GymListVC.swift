//
//  GymListVC.swift
//  Forma
//
//  Created by Mac on 6/26/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class GymListVC: UIViewController{

    @IBOutlet weak var gemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName_gymCustomeCell = UINib(nibName: "GymListCustomCell", bundle: nil)
       gemListTableView.register(nibName_gymCustomeCell, forCellReuseIdentifier: "gym")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gymListVCBackButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
extension GymListVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.performSegue(withIdentifier: "showgym", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = gemListTableView.dequeueReusableCell(withIdentifier: "gym", for: indexPath) as! GymListCustomCell
        cell.selectionStyle = .none
        cell.adress_label.layer.cornerRadius = 10
        cell.distance_view.layer.cornerRadius = 20
        //cell.logo_imageView.setRoundedView()
       cell.logo_imageView.layer.cornerRadius = cell.logo_imageView.frame.size.width/2
       cell.logo_imageView.clipsToBounds = true
   
        return cell
    }
   
        
    }


