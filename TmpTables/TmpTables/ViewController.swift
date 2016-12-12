//
//  ViewController.swift
//  TmpTables
//
//  Created by na on 2016. 12. 8..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
    }
    

    
    func setupUI(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    // DataSOurce delegation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let identifier: String = "myCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            // default, value1, value2, subtitle 의 템플릿이 있음
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        

        cell?.textLabel?.text = "Row \(indexPath.row)"
        cell?.detailTextLabel?.text = "\(Date())"
        return cell!
    }


}

