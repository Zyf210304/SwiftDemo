//
//  ViewController.swift
//  YFSwiftStudy_04
//
//  Created by 亚飞 on 2018/4/27.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView:UIScrollView!
    let kScreenW = UIScreen.main.bounds.size.width
    let kScreenH = UIScreen.main.bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.initUI()
    }

    func initUI() {



        scrollView = UIScrollView(frame:CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        self.view.addSubview(scrollView)
        scrollView.isPagingEnabled = true

        let leftVC:leftViewController = leftViewController()
        let centerCameraVC:CenterCameraViewController = CenterCameraViewController()
        let rightVC:rightViewController = rightViewController()

        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMove(toParentViewController: self)

        self.addChildViewController(centerCameraVC)
        self.scrollView.addSubview(centerCameraVC.view)
        centerCameraVC.didMove(toParentViewController: self)

        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMove(toParentViewController: self)

        leftVC.view.frame = self.view.frame

        var centerFarme:CGRect = self.view.frame
        centerFarme.origin.x = kScreenW
        centerCameraVC.view.frame = self.view.frame

        leftVC.view.frame = centerFarme

        var rightFrame:CGRect = self.view.frame
        rightFrame.origin.x = kScreenW * 2
        rightVC.view.frame = rightFrame

        scrollView.contentSize = CGSize(width: kScreenW * 3, height: kScreenH)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

