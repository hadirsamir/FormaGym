//
//  NewsCollectionViewCell.swift
//  Forma
//
//  Created by mac on 6/26/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsDetails: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
