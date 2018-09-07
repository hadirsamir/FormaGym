//
//  NearByTab.swift
//  Forma
//
//  Created by mac on 7/1/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class NearByTab: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    
        @IBOutlet weak var NearByGymTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NearByGymTable.delegate = self
        NearByGymTable.dataSource = self
        
        
        // adding our .xib file to nearbytableView
        let nib_nearby_cell = UINib(nibName: "NearByTableViewCell", bundle: nil)
        NearByGymTable.register(nib_nearby_cell, forCellReuseIdentifier: "near")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let near_gym_cell = NearByGymTable.dequeueReusableCell(withIdentifier: "near", for: indexPath) as! NearByTableViewCell
        near_gym_cell.selectionStyle = .none
        near_gym_cell.distance_view.setRoundedView()
            near_gym_cell.gym_logo.layer.cornerRadius = near_gym_cell.gym_logo.frame.size.width/2
            near_gym_cell.gym_logo.clipsToBounds = true
        return near_gym_cell
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
