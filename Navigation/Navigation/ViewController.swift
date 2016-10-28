//
//  ViewController.swift
//  Navigation
//
//  Created by na on 2016. 10. 26..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn = true
    var isImageZoom = false
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use bar button"
        }
        // 메인화면 > 수정화면 메시지 전달
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isImageZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(controller: EditViewController, isZoom: Bool) {
        if ( isImageZoom == isZoom ){
            return
        } else {
            isImageZoom = isZoom
        }
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if( isZoom ){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        } else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        }

    }

}

