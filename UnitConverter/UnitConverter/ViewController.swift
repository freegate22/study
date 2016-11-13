//
//  ViewController.swift
//  UnitConverter
//
//  Created by na on 2016. 11. 10..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var tempText: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func convertTemp(_ sender: UIButton) {
        if let fahrenheit = Double(tempText.text!) {
            let celsius = (fahrenheit - 32)/1.8
            let resultText = "Celsius \(celsius)"
            resultLabel.text = resultText
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tempText.endEditing(true)
    }
    @IBAction func textFieldReturn(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

}

