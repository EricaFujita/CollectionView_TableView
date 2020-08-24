//
//  ShopTableViewCell.swift
//  CollectionViewandTableView
//
//  Created by 藤田えりか on 2019/02/15.
//  Copyright © 2019 com.erica. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // カスタムセルの登録
        let nib = UINib(nibName: "ShopCollectionViewCell", bundle: nil)
        shopCollectionView.register(nib, forCellWithReuseIdentifier: "ShopCollectionViewCell2")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        shopCollectionView.delegate = dataSourceDelegate
        shopCollectionView.dataSource = dataSourceDelegate
        shopCollectionView.tag = row
        shopCollectionView.reloadData()
        
    }
}

