//
//  ViewController.swift
//  imageViewer
//
//  Created by na on 2016. 10. 19..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!

    var imgName = ["01.JPG", "02.JPG", "03.JPG", "04.JPG","05.jpg","06.png"]
    var currentImageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = UIImage(named: imgName[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func actionPrev(_ sender: AnyObject) {
        if( currentImageNum != 0 ){
            currentImageNum = currentImageNum - 1
            imgView.image = UIImage(named: imgName[currentImageNum])
        }
    }
    @IBAction func actionNext(_ sender: AnyObject) {
        if( currentImageNum != 5 ){
            currentImageNum = currentImageNum + 1
            imgView.image = UIImage(named: imgName[currentImageNum])
        }
    }
}

