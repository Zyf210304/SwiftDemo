//
//  Interest.swift
//  YFSwiftStudy_05
//
//  Created by 亚飞 on 2018/5/19.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

class Interest: NSObject {
    var title = ""
    var Description = ""
    var numberOfMember = 0
    var numberOfPost = 0
    var featuredImage : UIImage!

    override init() {

    }
    
    init(title: String, description: String, featuredImage: UIImage) {
        self.title = title
        self.Description = description
        self.featuredImage = featuredImage
        numberOfMember = 1
        numberOfPost = 1
    }


    static func createInterests() -> [Interest]
    {
        return [
            Interest(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!),
            Interest(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!),
            Interest(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!),
            Interest(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!),
            Interest(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!),
            Interest(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!),
        ]
    }

    override var description: String {
        return self.title
    }
}
