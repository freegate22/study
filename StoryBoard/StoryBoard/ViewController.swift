//
//  ViewController.swift
//  StoryBoard
//
//  Created by na on 2016. 11. 14..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scene1Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! Scene2ViewController
        destination.labelText = "Arrived from Scene 1"
    }

    @IBAction func returned(segue: UIStoryboardSegue) {
        scene1Label.text = "Returned from Scene 2"
    }

}

