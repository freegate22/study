//
//  ViewController.swift
//  AutoLayoutExampleByCode
//
//  Created by na on 2016. 11. 14..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let superView = self.view
        
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "My Label"
        
        let myButton = UIButton()
        
        myButton.setTitle("My Button", for: UIControlState.normal)
        myButton.backgroundColor = UIColor.blue
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        superView?.addSubview(myLabel)
        superView?.addSubview(myButton)
        
        
        var myConstraint = NSLayoutConstraint(
                    item: myLabel,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: superView,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0)
        superView?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(
            item: myLabel,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: superView,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0)
        superView?.addConstraint(myConstraint)
        
        
        
        myConstraint = NSLayoutConstraint(
            item: myButton,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: myLabel,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: -10)
        superView?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(
            item: myButton,
            attribute: NSLayoutAttribute.firstBaseline,
            relatedBy: NSLayoutRelation.equal,
            toItem: myLabel,
            attribute: NSLayoutAttribute.firstBaseline,
            multiplier: 1.0,
            constant: 0)
        superView?.addConstraint(myConstraint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

