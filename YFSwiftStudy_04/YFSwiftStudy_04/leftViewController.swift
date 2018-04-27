//
//  leftViewController.swift
//  YFSwiftStudy_04
//
//  Created by 亚飞 on 2018/4/27.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit
import AVFoundation

class leftViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var cameraView: UIView!
    var tempImageView: UIImageView!

    var captureSession : AVCaptureSession?
    var stillImageOutput :  AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.green


        cameraView = UIView(frame:self.view.frame)
        self.view.addSubview(cameraView)

        tempImageView = UIImageView(frame:self.view.frame)
        self.view.addSubview(tempImageView)

//        UIApplication.shared.isStatusBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        previewLayer?.frame = cameraView.bounds
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080

        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        var error : NSError?
        var input: AVCaptureDeviceInput!

        do {
            input = try AVCaptureDeviceInput(device: backCamera!) }
        catch let error1 as NSError {
            error = error1
            input = nil
        }

        if (error == nil && captureSession?.canAddInput(input) != nil) {

            captureSession?.addInput(input)

            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]

            if (captureSession?.canAddOutput(stillImageOutput!) != nil) {
                captureSession?.addOutput(stillImageOutput!)

                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }

        }
    }


    func didPressTakePhoto(){

        if let videoConnection = stillImageOutput?.connection(with: AVMediaType.video){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
                (sampleBuffer, error) in

                if sampleBuffer != nil {


                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider  = CGDataProvider(data: imageData! as CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)

                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)

                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false

                }


            })
        }


    }


    var didTakePhoto = Bool()

    func didPressTakeAnother(){
        if didTakePhoto == true{
            tempImageView.isHidden = true
            didTakePhoto = false

        }
        else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()

        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
