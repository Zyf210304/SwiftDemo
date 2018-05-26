//
//  ViewController.swift
//  YFSwiftStudy_08
//
//  Created by 亚飞 on 2018/5/26.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit
import AVFoundation

var Random_color = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()

    let gradientLayer = CAGradientLayer()

    var timer : Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()


    }

    func initUI() {
        self.view.backgroundColor = Random_color
        let frame_w = UIScreen.main.bounds.size.width
        let frame_h = UIScreen.main.bounds.size.height

        let centerBtn = UIButton(type: .custom)
        centerBtn.frame = CGRect(x: frame_w / 2 - 74, y: frame_h / 2 - 94 , width: 148, height: 148)
        centerBtn.setImage(#imageLiteral(resourceName: "music play"), for: .normal)
        centerBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        centerBtn.addTarget(self, action: #selector(playMusicButton), for: .touchUpInside)
        self.view.addSubview(centerBtn)
    }

    @objc func playMusicButton() {
        //play bg music
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)

            audioPlayer.prepareToPlay()
            audioPlayer.play()

        }
        catch let audioError as NSError {
            print(audioError)
        }

        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }



        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor(white: 0.4, alpha: 0.2).cgColor as CGColor

        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        self.view.layer.addSublayer(gradientLayer)
    }

    @objc func randomColor() {

        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())


        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

