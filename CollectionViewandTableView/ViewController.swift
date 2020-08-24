//
//  ViewController.swift
//  CollectionViewandTableView
//
//  Created by 藤田えりか on 2019/02/15.
//  Copyright © 2019 com.erica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dogs = [["name" : "サクラキ",
                 "imageName" : "sl3.jpg"],
                ["name" : "サクラキ",
                 "imageName" : "sl3.jpg"],
                ["name" : "サクラキ",
                 "imageName" : "sl3.jpg"]]
    var dogs2 = [["name" : "散歩",
                  "imageName" : "sl4.jpg"],
                 ["name" : "散歩",
                  "imageName" : "sl4.jpg"],
                 ["name" : "散歩",
                  "imageName" : "sl4.jpg"]]
    var dogs3 = [["name" : "散歩後",
                  "imageName" : "sl5.jpg"],
                 ["name" : "散歩後",
                  "imageName" : "sl5.jpg"],
                 ["name" : "散歩後",
                  "imageName" : "sl5.jpg"]]
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ファイル内処理
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        //カスタムセル登録
        let nib = UINib(nibName: "ShopTableViewCell", bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: "ShopTableViewCell2")
        
        //tableViewの使わないセルの区切り線を消す
        homeTableView.tableFooterView = UIView()
        
        //tableViewの高さ指定
        homeTableView.rowHeight = 200
    }
}

//extensionでcollectionViewについて
extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell2", for: indexPath) as! ShopCollectionViewCell
        
        switch (collectionView.tag) {
        case 0:
            cell.imageView.image = UIImage(named: dogs[indexPath.row]["imageName"]!)
            cell.textLabel.text = dogs[indexPath.row]["name"]
            
        case 1:
            cell.imageView.image = UIImage(named: dogs2[indexPath.row]["imageName"]!)
            cell.textLabel.text = dogs2[indexPath.row]["name"]
            
        case 2:
            cell.imageView.image = UIImage(named: dogs3[indexPath.row]["imageName"]!)
            cell.textLabel.text = dogs3[indexPath.row]["name"]
            
        default:
            print("section error")
        }
        return cell
    }
}



//extensionでtableViewについて
extension ViewController:   UITableViewDataSource, UITableViewDelegate {
    
    //セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //セクション内のセル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ShopTableViewCell else { return }
        
        //ShopTableViewCell.swiftで設定したメソッドを呼び出す
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
    }
    
    //セルの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell2", for: indexPath) as! ShopTableViewCell
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        cell.shopCollectionView.reloadData()
        return cell
    }
    
    //セルが選択された時の対処
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分類\(section + 1)"
    }
    
}

