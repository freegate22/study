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

    @IBOutlet var tbvFolder: UITableView!
    @IBOutlet var edit: UIBarButtonItem!
    
    @IBAction func doEdit(_ sender: UIBarButtonItem) {
        if (tbvFolder.isEditing) {
            edit.title = "Edit"
            tbvFolder.setEditing(false, animated: true)
        } else {
            edit.title = "Done"
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
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("this")
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
            print("editing2")
        } else {
            // re-enable disabled widgets (optional)
            print("not editing")
        }
    }
}

extension ViewController: UITableViewDelegate{
    
}
