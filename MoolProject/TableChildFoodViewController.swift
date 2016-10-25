//
//  TableChildFoodViewController.swift
//  MoolProject
//
//  Created by 中山 陽介 on 2016/10/13.
//  Copyright © 2016 Yosuke Nakayama. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class TableChildFoodViewController: UITableViewController, IndicatorInfoProvider {
    
    
    let cellIdentifier = "ShowDataTableViewCell"
    let product = "ProductTableViewCell"
    var blackTheme = false
    var itemInfo = IndicatorInfo(title: "View")
    
    var storedOffsets = [Int: CGFloat]()
    
    init(style: UITableViewStyle, itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: product, bundle: Bundle.main), forCellReuseIdentifier: product)
        tableView.register(UINib(nibName: cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        
//        tableView.estimatedRowHeight = 88.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
//        tableView.allowsSelection = false
        if blackTheme {
            tableView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var heightForRow:CGFloat = 0.0
        if indexPath.section == 0{
            heightForRow = 168.0
        }else if indexPath.section == 1{
            heightForRow = 88.0
        }
        return heightForRow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {


    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        
        if section == 0{
            numberOfRows = 2
        }else if section == 1{
            numberOfRows = 2
        }
        
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:

            let cell = tableView.dequeueReusableCell(withIdentifier: product, for: indexPath) as! ProductTableViewCell
            cell.collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")

            cell.collectionView.viewWithTag(0)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ShowDataTableViewCell
            cell.collectionView.register(UINib(nibName: "ShowDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
            cell.collectionView.viewWithTag(1)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ShowDataTableViewCell

            cell.collectionView.register(UINib(nibName: "ShowDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
            cell.collectionView.viewWithTag(99)

            return cell
        }
        
    }
    

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            guard let tableViewCell = cell as? ProductTableViewCell else {
                return
            }
            tableViewCell.collectionView.delegate = self
            tableViewCell.collectionView.dataSource = self
            //            tableViewCell.collectionView.tag = indexPath.row
            
            tableViewCell.collectionView.reloadData()
        
        case 1:
            
            guard let tableViewCell = cell as? ShowDataTableViewCell else { return }
            
            tableViewCell.collectionView.delegate = self
            tableViewCell.collectionView.dataSource = self
            //            tableViewCell.collectionView.tag = indexPath.row
            tableViewCell.collectionView.setContentOffset(tableViewCell.collectionView.contentOffset, animated: false)
            //        tableViewCell.collectionView.backgroundColor = .yellow
            tableViewCell.collectionView.reloadData()
            
            
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0

        default:
            guard let tableViewCell = cell as? ShowDataTableViewCell else { return }
            
            tableViewCell.collectionView.delegate = self
            tableViewCell.collectionView.dataSource = self
//            tableViewCell.collectionView.tag = indexPath.row
            tableViewCell.collectionView.setContentOffset(tableViewCell.collectionView.contentOffset, animated: false)
            //        tableViewCell.collectionView.backgroundColor = .yellow
            tableViewCell.collectionView.reloadData()
            
            
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }

    }
    
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            guard let tableViewCell = cell as? ProductCollectionViewCell else { return }
        case 1:
            guard let tableViewCell = cell as? ShowDataTableViewCell else { return }
            
            storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        default:
            guard let tableViewCell = cell as? ShowDataTableViewCell else { return }
            
            storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        }

        
    }
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Food's Title"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Yeah"
    }
    

}


extension TableChildFoodViewController : UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        print("tag: \(collectionView.tag)")

   
        switch collectionView.tag{
        case 0:
            
//            let cellTable = self.tableView.dequeueReusableCell(withIdentifier: product) as! ProductTableViewCell
//            
//            let cell = cellTable.collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
//            return cell
            
            
            print("collectionView.tag = 1 \(collectionView)")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
            return cell
            
        case 1:
//            guard let collectionView = collectionView as! ShowDataTableViewCell { return }
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ShowDataCollectionViewCell
//            return cell
            
            
//            let cellTable = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ShowDataTableViewCell
//            
//            let cell = cellTable.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ProductCollectionViewCell
//            return cell
            print("collectionView.tag = 2 \(collectionView)")
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ShowDataCollectionViewCell
            return cell

            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ShowDataCollectionViewCell
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
//        print("clicked yeah huh\(indexPath.item)")
    
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath.item)")

    
    }
    
    


}




