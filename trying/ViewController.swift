//
//  ViewController.swift
//  trying
//
//  Created by Varun Vyas on 22/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit


class ViewController: UIViewController,G8TesseractDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let chat = UIImage(named: "menu1")
        performImageRecognition(chat!)
        //var chatImageView = UIImageView(image: chat)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func performImageRecognition(image: UIImage) {
        // 1
        let tesseract:G8Tesseract = G8Tesseract(language:"eng");
        // 2
        tesseract.language = "eng"
        // 3
        //tesseract.engineMode = .TesseractCubeCombined
        // 4
        tesseract.pageSegmentationMode = .Auto
        // 5
        tesseract.maximumRecognitionTime = 60.0
        // 6

        tesseract.image = image.g8_blackAndWhite()
        
        tesseract.charWhitelist = "abcdefghijklmnopqrstwxyz0123456789ABCDEFGHIJKLMNOPQRSTWXYZ.$";
        

        tesseract.recognize()
        print(tesseract.recognizedText)
        // 7
//        textView.text = tesseract.recognizedText
//        textView.editable = true
//        // 8
//        removeActivityIndicator()
    }
}

