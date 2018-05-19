//
//  ViewController.swift
//  YFSwiftStudy_06
//
//  Created by 亚飞 on 2018/5/19.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit
import CoreLocation

let Frame_Width = UIScreen.main.bounds.size.width
let Frame_Height = UIScreen.main.bounds.size.height

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationLable: UILabel!
    var locationManager: CLLocationManager!

    let Scale = Frame_Width / 375

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.initUI();
    }

    private func initUI() {
        self.view.layer.contents = #imageLiteral(resourceName: "bg").cgImage

        let blurEffect = UIBlurEffect(style:.dark)

        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.frame
        self.view.addSubview(blurView)


        locationLable = UILabel(frame:CGRect(x: (24 * Scale), y: (40 * Scale), width: (Frame_Width - 48 * Scale), height: (90 * Scale)))
        locationLable.textColor = UIColor.white
        locationLable.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        locationLable.textAlignment = .center
        locationLable.numberOfLines = 0
        locationLable.text = "My Location"
        self.view.addSubview(locationLable)



        let location_Btn = UILabel(frame:CGRect(x: (24 * Scale), y: (Frame_Height - 100 * Scale), width: (Frame_Width - 48 * Scale), height: (78 * Scale)))
        location_Btn.isUserInteractionEnabled = true;
        let tapG = UITapGestureRecognizer.init(target: self, action: #selector(showMyLocation(tap:)))
        location_Btn.addGestureRecognizer(tapG)
        location_Btn.text = "Find my location"
        location_Btn.textColor = UIColor.white
        location_Btn.textAlignment = .center

        let lblBG = UIImageView(frame:location_Btn.frame)
        lblBG.center = CGPoint(x: lblBG.center.x, y: lblBG.center.y + 4)
        lblBG.image = #imageLiteral(resourceName: "Find my location")
        self.view .addSubview(lblBG)
        self.view.addSubview(location_Btn)



    }

    @objc func showMyLocation(tap: UITapGestureRecognizer) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLable.text =  "Error while updating location " + error.localizedDescription
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in

            if (error != nil) {
                self.locationLable.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }

            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.locationLable.text = "Problem with the data received from geocoder"
            }
        })
    }

    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()

            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""

            self.locationLable.text = postalCode! + " " + locality!

            self.locationLable.text?.append("\n" + administrativeArea! + ", " + country!)
        }

    }
}

























