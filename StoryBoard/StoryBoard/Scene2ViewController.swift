//
//  Scene2ViewController.swift
//  StoryBoard
//
//  Created by na on 2016. 11. 14..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {

    @IBOutlet var scene2Label: UILabel!
    
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scene2Label.text = labelText
        
//        self.performSegue(withIdentifier: "SegueToScene1", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
