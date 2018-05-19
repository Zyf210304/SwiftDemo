//
//  ViewController.swift
//  YFSwiftStudy_05
//
//  Created by 亚飞 on 2018/5/19.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var colltionView : UICollectionView?
    fileprivate var interests = Interest.createInterests()

    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height//获取屏幕高


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.cyan
        self.initUI()
    }

    func initUI() {
        let layout = UICollectionViewFlowLayout()

        self.view?.layer.contents = #imageLiteral(resourceName: "blue").cgImage;

        print(interests)
        
        colltionView = UICollectionView(frame:CGRect(x:0 ,y:100 ,width: width, height: height - 200), collectionViewLayout: layout)
        //注册一个cell
        colltionView!.register(InterestCollectionViewCell.self, forCellWithReuseIdentifier:"InterestCell")
        colltionView?.delegate = self;
        colltionView?.dataSource = self;
        colltionView?.backgroundColor = UIColor.clear
        //设置每一个cell的宽高
        layout.itemSize = CGSize(width: 300, height: 400)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(15 , 15 , 15 , 15)
        layout.scrollDirection = .horizontal;

        self.view.addSubview(colltionView!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count;
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        cell.setvalueWith(interests[indexPath.item])
        return cell
    }

}
