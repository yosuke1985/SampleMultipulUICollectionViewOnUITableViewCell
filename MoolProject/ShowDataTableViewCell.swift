//
//  ShowDataTableViewCell.swift
//  MoolProject
//
//  Created by 中山 陽介 on 2016/10/14.
//  Copyright © 2016 Yosuke Nakayama. All rights reserved.
//

import UIKit

class ShowDataTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var nibName: String? = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "ShowDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.register(ShowDataCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        self.collectionView.viewWithTag(0)

   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
    var collectionViewOffset: CGFloat{
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    
    
    }

    
    
}
