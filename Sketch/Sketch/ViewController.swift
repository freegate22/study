//
//  ViewController.swift
//  Sketch
//
//  Created by na on 2016. 11. 2..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.black.cgColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLineUp(_ sender: UIButton) {
        lineSize = lineSize + 1.0
    }
  
    @IBAction func btnLineDown(_ sender: UIButton) {
        if( lineSize >= 1.0 ){
            lineSize = lineSize - 1.0

        }

    }
    
    @IBAction func btnColorRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    @IBAction func btnColorYellow(_ sender: UIButton) {
        lineColor = UIColor.yellow.cgColor
    }
    @IBAction func btnColorBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    @IBAction func btnColorBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil
        lineSize = 1.0
        lineColor = UIColor.black.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()!.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()!.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()!.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect.init(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint.init(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint.init(x: currPoint.x, y: currPoint.y))
        
        UIGraphicsGetCurrentContext()!.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()!.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()!.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()!.setLineWidth(lineSize)

        imgView.image?.draw(in: CGRect.init(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))

        UIGraphicsGetCurrentContext()?.move(to: CGPoint.init(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint.init(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()!.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            imgView.image = nil
        }
    }
}

