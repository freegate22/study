//
//  ViewController.swift
//  FileExample
//
//  Created by na on 2016. 11. 27..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textBox: UITextField!
    var fileMgr: FileManager = FileManager.default
    var docsDir: String?
    var dataFile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        dataFile = dirPaths[0].absoluteURL.appendingPathComponent("datafile.dat").path
        
        if fileMgr.fileExists(atPath: dataFile!) {
            let databuffer = fileMgr.contents(atPath: dataFile!)
            let datastring = NSString(data: databuffer!, encoding:String.Encoding.utf8.rawValue )
            textBox.text = datastring as? String
        }
        
        
    }
    
    @IBAction func saveText(_ sender: UIButton) {
        let databuffer = (textBox.text)!.data(using: String.Encoding.utf8)
        fileMgr.createFile(atPath: dataFile!, contents: databuffer, attributes: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

