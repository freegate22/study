//
//  ViewController.swift
//  DrowGraphics
//
//  Created by na on 2016. 11. 1..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지뷰의 크기와 일치시킨다.
        let context = UIGraphicsGetCurrentContext()     // 생성한 콘텍스트의 정보를 가져옵니다.
        
        context!.setLineWidth(2.0)                      // 굵기
        context!.setStrokeColor(UIColor.red.cgColor)    // 색상
        
        context!.move(to: CGPoint.init(x: 50, y: 50))   // 시작점 (0,0이 좌측상단)
        context!.addLine(to: CGPoint.init(x: 250, y: 250))  // 끝점
        context!.strokePath()                           // 그리기
        
        context!.setLineWidth(4.0)                      // 굵기
        context!.setStrokeColor(UIColor.blue.cgColor)   // 색상
        
        context!.move(to: CGPoint.init(x: 150, y: 200)) // 시작점
        context!.addLine(to: CGPoint.init(x: 250, y: 350))  // 선긋기
        context!.addLine(to: CGPoint.init(x: 50, y: 350))   // 선긋기
        context!.addLine(to: CGPoint.init(x: 150, y: 200))  // 선긋기
        context!.strokePath()   // 그리기
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지뷰에 넣기
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
    }
    @IBAction func btnDrawsRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지뷰의 크기와 일치시킨다.
        let context = UIGraphicsGetCurrentContext()     // 생성한 콘텍스트의 정보를 가져옵니다.
        
        context!.setLineWidth(2.0)                      // 굵기
        context!.setStrokeColor(UIColor.red.cgColor)    // 색상
        
        context!.addRect(CGRect(x: 50, y: 100, width: 200, height: 200)) // 사각형 그리기
        context!.strokePath()                           // 그리기

        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지뷰에 넣기
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄

    }

    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지뷰의 크기와 일치시킨다.
        let context = UIGraphicsGetCurrentContext()     // 생성한 콘텍스트의 정보를 가져옵니다.
        
        context!.setLineWidth(2.0)                      // 굵기
        context!.setStrokeColor(UIColor.red.cgColor)    // 색상
        
        context!.addEllipse(in: CGRect(x: 50, y: 50, width: 200, height: 100)) // 원 그리기
        context!.strokePath()                           // 그리기
        
        context!.setLineWidth(5.0)                      // 굵기
        context!.setStrokeColor(UIColor.green.cgColor)    // 색상
        
        context!.addEllipse(in: CGRect(x: 50, y: 200, width: 200, height: 200)) // 원 그리기
        context!.strokePath()                           // 그리기
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지뷰에 넣기
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지뷰의 크기와 일치시킨다.
        let context = UIGraphicsGetCurrentContext()     // 생성한 콘텍스트의 정보를 가져옵니다.
        
        context!.setLineWidth(5.0)                      // 굵기
        context!.setStrokeColor(UIColor.red.cgColor)    // 색상
        
        context!.move(to: CGPoint.init(x: 50, y: 50))   // 시작점
        context!.addArc(tangent1End: CGPoint.init(x: 200, y: 50), tangent2End: CGPoint.init(x: 200, y: 200), radius: 50)                                   // 호 그리기
        context!.addLine(to: CGPoint.init(x: 200, y: 200))  // 선긋기
        
        context!.move(to: CGPoint.init(x: 100, y: 250))   // 시작점
        context!.addArc(tangent1End: CGPoint.init(x: 250, y: 250), tangent2End: CGPoint.init(x: 100, y: 400), radius: 20)                                   // 호 그리기
        context!.addLine(to: CGPoint.init(x: 100, y: 400))  // 선긋기
        
        context!.strokePath()                           // 그리기
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지뷰에 넣기
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트를 이미지뷰의 크기와 일치시킨다.
        let context = UIGraphicsGetCurrentContext()     // 생성한 콘텍스트의 정보를 가져옵니다.
        
        // Draw Rectangle
        context!.setLineWidth(1.0)                      // 굵기
        context!.setStrokeColor(UIColor.red.cgColor)    // 색상
        context!.setFillColor(UIColor.red.cgColor)      // 색 채우기
        
        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 100)
        
        context!.addRect(rectangle)
        context!.fill(rectangle)
        context!.strokePath()
        
        // Draw Circle
        context!.setLineWidth(1.0)                      // 굵기
        context!.setStrokeColor(UIColor.blue.cgColor)    // 색상
        context!.setFillColor(UIColor.blue.cgColor)      // 색 채우기
        
        let circle = CGRect(x: 50, y: 200, width: 200, height: 100)
        
        context!.addEllipse(in: circle) // 원 그리기
        context!.fillEllipse(in: circle)
        context!.strokePath()
        
        // Draw Triangle
        context!.setLineWidth(1.0)                      // 굵기
        context!.setStrokeColor(UIColor.green.cgColor)    // 색상
        context!.setFillColor(UIColor.green.cgColor)      // 색 채우기

        context!.move(to: CGPoint.init(x: 150, y: 350))   // 시작점
        context!.addLine(to: CGPoint.init(x: 250, y: 450))  // 선긋기
        context!.addLine(to: CGPoint.init(x: 50, y: 450))   // 선긋기
        context!.addLine(to: CGPoint.init(x: 150, y: 350))  // 선긋기
        context!.fillPath()
        context!.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 이미지뷰에 넣기
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
    }
}

