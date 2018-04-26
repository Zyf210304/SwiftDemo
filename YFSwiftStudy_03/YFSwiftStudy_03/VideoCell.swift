//
//  VideoCell.swift
//  YFSwiftStudy_03
//
//  Created by 亚飞 on 2018/4/26.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

struct video {
    let image: String!
    let title: String!
    let source: String!
}


class VideoCell: UITableViewCell {

    var videoScreentShot: UIImageView!
    var videoTitleLabel: UILabel!
    var videoSourceLabel: UILabel!


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.initUI()
    }

    func initUI() {
        let kScreenW = UIScreen.main.bounds.size.width
        let kScreenH = UIScreen.main.bounds.size.height
        let cell_H = kScreenH / 3
        videoScreentShot = UIImageView()
        videoScreentShot.frame = CGRect(x: 0, y: 0, width: kScreenW, height: cell_H)
        videoScreentShot.backgroundColor = UIColor.black
        self.addSubview(videoScreentShot)


        videoTitleLabel = UILabel.init()
        videoTitleLabel.textColor = UIColor.white
        videoTitleLabel.frame = CGRect(x: 0, y: cell_H / 5 * 4, width: kScreenW , height: cell_H / 10)
        videoTitleLabel.font = UIFont.systemFont(ofSize: 15)
        videoTitleLabel.textAlignment = .center
        self.addSubview(videoTitleLabel)

        videoSourceLabel = UILabel.init()
        videoSourceLabel.frame = CGRect(x: 0, y: cell_H / 10 * 9, width: kScreenW , height: cell_H / 10)
        videoSourceLabel.textColor = UIColor.lightGray
        videoSourceLabel.textAlignment = .center
        videoSourceLabel.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(videoSourceLabel)

        let centerImg : UIImageView!
        centerImg = UIImageView.init();
        centerImg.frame = CGRect(x : (kScreenW - 50) / 2, y: (kScreenH / 3 - 50) / 2 + 20, width: 50, height:50)
        centerImg.image = UIImage(named:"playBtn")
        self.addSubview(centerImg)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}





