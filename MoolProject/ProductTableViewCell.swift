//
//  ProductTableViewCell.swift
//  MoolProject
//
//  Created by 中山 陽介 on 2016/10/21.
//  Copyright © 2016 Yosuke Nakayama. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var nibName: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
//        self.collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        self.collectionView.viewWithTag(1)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
