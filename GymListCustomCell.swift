//
//  GymListCustomCell.swift
//  Forma
//
//  Created by Mac on 6/26/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class GymListCustomCell: UITableViewCell {

    @IBOutlet weak var logo_imageView: UIImageView!
    
    @IBOutlet weak var name_label: UILabel!
    
    @IBOutlet weak var adress_label: UILabel!
    
    @IBOutlet weak var view_label: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var distance_view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    self.distance_view.setRoundedView(radiusNumber:13)
    self.adress_label.setRoundedView(radiusNumber:100)
        self.logo_imageView.setRoundedView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
