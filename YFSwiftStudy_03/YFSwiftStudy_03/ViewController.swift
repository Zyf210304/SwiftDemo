//
//  ViewController.swift
//  YFSwiftStudy_03
//
//  Created by 亚飞 on 2018/4/26.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var videoTableView: UITableView!

    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]


    var playViewController = AVPlayerViewController()
    var playView = AVPlayer()

    func pushVideo() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")

        playView = AVPlayer(url: URL(fileURLWithPath: path!))

        playViewController.player = playView

        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }

    func initUI() {
        videoTableView = UITableView(frame: UIScreen.main.bounds, style:.plain)
        videoTableView.delegate = self;
        videoTableView.dataSource = self;
        videoTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(videoTableView)

        //划重点  cell的标记
        videoTableView.register(VideoCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
// 涨姿势 这样代理方法放一起  还方便维护 还好看！！！！！
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 3
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:VideoCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!VideoCell

        let video = data[indexPath.row]

        cell.videoTitleLabel.text = video.title
        cell.videoScreentShot.image = UIImage(named: video.image)
        cell.videoSourceLabel.text = video.source
        return cell
    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushVideo()
    }

}
