//
//  ViewController.swift
//  StackViewEx
//
//  Created by na on 2016. 11. 23..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cupStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addCup(_ sender: UIButton) {
        let cupImage = UIImageView(image: UIImage(named: "RedCoffeeCup"))
        cupImage.contentMode = .scaleAspectFit
        
        UIView.animate(withDuration: 0.75, animations: {
            self.cupStackView.addArrangedSubview(cupImage)
            self.cupStackView.layoutIfNeeded()
        })
    }

    @IBAction func removeCup(_ sender: UIButton) {
        let lastAddedCup = self.cupStackView.arrangedSubviews.last
        
        if let cup = lastAddedCup
        {
            UIView.animate(withDuration: 0.25, animations: {
                self.cupStackView.removeArrangedSubview(cup)
                cup.removeFromSuperview()
                self.cupStackView.layoutIfNeeded()
            })
        }
    }
}

