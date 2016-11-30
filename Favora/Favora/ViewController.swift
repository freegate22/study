//
//  ViewController.swift
//  Favora
//
//  Created by na on 2016. 11. 29..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

var folderNames: [String] = ["포털","블로그","카페","쇼핑몰","기타"]
var siteNames = ["Yahoo","Google","Apple","Bing","nate"]
var siteAddresses = ["https://www.yahoo.com","https://www.google.com","https://www.apple.com","https://www.bing.com","https://www.nate.com"]

class ViewController: UIViewController {

    @IBOutlet var tbvFolder: UITableView!
    @IBOutlet var edit: UIBarButtonItem!
    
    @IBAction func doEdit(_ sender: UIBarButtonItem) {
        if (tbvFolder.isEditing) {
            edit.title = "수정"
            tbvFolder.setEditing(false, animated: true)
        } else {
            edit.title = "확인"
            tbvFolder.setEditing(true, animated: true)
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



}


// tableview의 datasource와 delegate 등록
extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return folderNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as! FolderTableViewCell
            
            let row = indexPath.row
            cell.lblFolderName.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            cell.lblFolderName.text = folderNames[row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SiteTableViewCell", for: indexPath) as! SiteTableViewCell
            
            let siteRow = indexPath.row
            cell.lblName.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            cell.lblName.text = siteNames[siteRow]
            cell.lblUrl.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
            cell.lblUrl.text = siteAddresses[siteRow]
            return cell
        }


        
        // Configure the cell.        
 
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            folderNames.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemToMove = folderNames[fromIndexPath.row]
        
        folderNames.remove(at: fromIndexPath.row)
        folderNames.insert(itemToMove, at: to.row)
        
    }
    
    func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tbvFolder.setEditing(editing, animated: animated)
        if (editing) {
            // you might disable other widgets here... (optional)
        } else {
            // re-enable disabled widgets (optional)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "폴더"
        } else {
            return "site"
        }
    }
}

extension ViewController: UITableViewDelegate{
    
}
