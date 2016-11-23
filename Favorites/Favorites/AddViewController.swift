//
//  AddViewController.swift
//  Favorites
//
//  Created by na on 2016. 11. 23..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var lblName: UITextField!
    @IBOutlet var lblAddress: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        var address = lblAddress.text!
        if !address.hasPrefix("http://") && !address.hasPrefix("https://")
        {
            address = "http://" + address
        }
        
        attractionNames.append(lblName.text!)
        webAddresses.append(address)
        lblName.text = ""
        lblAddress.text = ""
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
