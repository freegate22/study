//
//  ViewController.swift
//  AutoLayoutVisible
//
//  Created by na on 2016. 11. 14..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let superview = self.view
        
        // 레이블 추가
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "My Label"
        
        // 버튼 추가
        let myButton = UIButton()
        myButton.backgroundColor = UIColor.red
        myButton.setTitle("My Button", for: UIControlState.normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 버튼, 레이블을 슈퍼뷰에 추가
        superview?.addSubview(myLabel)
        superview?.addSubview(myButton)
        
        // 뷰들의 딕셔너리 생성
        let viewsDictionary = ["myLabel": myLabel,"myButton": myButton]
        
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[myButton]-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: viewsDictionary))
        superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[myButton]-[myLabel(==myButton)]-|", options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: viewsDictionary))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

