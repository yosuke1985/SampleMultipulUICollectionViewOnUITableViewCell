//
//  ProductCollectionViewCell.swift
//  MoolProject
//
//  Created by 中山 陽介 on 2016/10/20.
//  Copyright © 2016 Yosuke Nakayama. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var nibName: String? = ""

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var infoName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
