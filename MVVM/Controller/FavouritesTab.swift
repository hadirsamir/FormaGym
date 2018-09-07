//
//  FavouritesTab.swift
//  Forma
//
//  Created by mac on 7/4/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class FavouritesTab: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var favourites_table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
           favourites_table.delegate = self
        favourites_table.dataSource = self
        // adding our .xib file to nearbytableView
        let nib_nearby_cell = UINib(nibName: "NearByTableViewCell", bundle: nil)
        favourites_table.register(nib_nearby_cell, forCellReuseIdentifier: "near")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fav_cell = favourites_table.dequeueReusableCell(withIdentifier: "near", for: indexPath) as! NearByTableViewCell
        fav_cell.selectionStyle = .none
        fav_cell.distance_view.setRoundedView()
        fav_cell.gym_logo.layer.cornerRadius = fav_cell.gym_logo.frame.size.width/2
        fav_cell.gym_logo.clipsToBounds = true
        return fav_cell
    }
    
    

    

}
