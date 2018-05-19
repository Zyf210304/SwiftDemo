//
//  InterestCollectionViewCell.swift
//  YFSwiftStudy_05
//
//  Created by 亚飞 on 2018/5/19.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

    var featuredImageView: UIImageView!
    var interestTitleLabel: UILabel!
    var centerView :UIView!


    fileprivate func upDateUI() {
//        interestTitleLabel?.text! = interest.title
//        featuredImageView?.image! = interest.featuredImage
    }


    override init(frame:CGRect){
        super.init(frame: frame)
        self.initUI(frame: frame)
    }

    func setvalueWith(_ interest : Interest) {
        interestTitleLabel?.text! = "   " + interest.title
        featuredImageView?.image = interest.featuredImage
    }

    private func initUI(frame:CGRect) {


        centerView = UIView(frame:CGRect(x: 0, y: 0, width: 300, height: 400))
        centerView.backgroundColor = UIColor.cyan
        self.addSubview(centerView)

        featuredImageView = UIImageView(frame:CGRect(x: 0, y:0 , width: 300, height: 400 - 60))
        featuredImageView.backgroundColor = UIColor.red
        featuredImageView.contentMode = .scaleAspectFill
        centerView.addSubview(featuredImageView);


        interestTitleLabel = UILabel(frame:CGRect(x:0, y: 340, width: 300, height:60))
        interestTitleLabel.backgroundColor = UIColor.purple
        interestTitleLabel.textColor = UIColor.white
        interestTitleLabel.text = "  1111111"
        centerView.addSubview(interestTitleLabel)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = 5.0

        self.clipsToBounds = true
    }


}
