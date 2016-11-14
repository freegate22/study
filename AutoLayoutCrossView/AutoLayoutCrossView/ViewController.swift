//
//  ViewController.swift
//  AutoLayoutCrossView
//
//  Created by na on 2016. 11. 14..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myButton: UIButton!
    @IBOutlet var viewB: UIView!
    @IBOutlet var centerConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewB.removeConstraint(centerConstraint)
        
        let constraint =
            NSLayoutConstraint(item: myLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: myButton, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraint(constraint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

