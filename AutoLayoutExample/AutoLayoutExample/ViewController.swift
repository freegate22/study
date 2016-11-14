//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by na on 2016. 11. 13..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    view1이 view2보다 20위에 있다.
//
//    view1.bottom = view2.bottom - 20
//        
//    var myConstraint = NSLayoutConstraint(
//            item: view1,
//            attribute: NSLayoutAttribute.bottom,
//            relatedBy: NSLayoutRelation.equal,
//            toItem: view2,
//            attribute: NSLayoutAttribute.bottom,
//            multiplier: 1.0,
//            constant: -20)
    
    

//    버튼의 폭을 label의 5배로 설정
//    var myConstraint = NSLayoutConstraint(
//            item: myButton,
//            attribute: NSLayoutAttribute.width,
//            relatedBy: NSLayoutRelation.equal,
//            toItem: myLabel,
//            attribute: NSLayoutAttribute.width,
//            multiplier: 5.0,
//            constant: 0)

    
//    크거나 같다.
//
//    myButton.width >= 200
//
//    var myConstraint = NSLayoutConstraint(
//            item: myButton,
//            attribute: NSLayoutAttribute.bottom,
//            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
//            toItem: nil,
//            attribute: NSLayoutAttribute.width,
//            multiplier: 1.0,
//            constant: 200)
    
    
//      추가하기
//      self.view.addConstraint(myConstraint)
    
//      자동 리사이징 끄기
//    let myButton = UIButton()
//    
//    myButton.setTitle("My Button", forState: UIControlState.Normal)
//    myButton.translatesAutoresizingMaskIntoContraint = false
//    
//    self.view.addSubView(myButton)
}

