//
//  ViewController.swift
//  Favora
//
//  Created by na on 2016. 11. 29..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

var folderNames: [String] = ["포털","블로그","카페","쇼핑몰","기타"]

class ViewController: UIViewController {

    @IBOutlet var folderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}


// tableview의 datasource와 delegate 등록
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return folderNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as! FolderTableViewCell
        
        let row = indexPath.row
        cell.lblFolderName.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.lblFolderName.text = folderNames[row]
        
        // Configure the cell...
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
}
