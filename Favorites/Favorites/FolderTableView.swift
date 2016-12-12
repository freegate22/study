//
//  FolderTableView.swift
//  Favorites
//
//  Created by na on 2016. 11. 29..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

var folderNames: [String] = ["포털","블로그","카페","쇼핑몰","기타"]

class FolderTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 테이블의 섹션 갯수
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 테이블에 뵤시될 행의 개수
        return folderNames.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "FolderTableViewCell", for: indexPath) as! FolderTableViewCell
        
        let row = indexPath.row
        cell.lblFolderName.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.lblFolderName.text = folderNames[row]
        
        // Configure the cell...
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 스토리보드간 데이터 전달하기
    // segue가 실행되기 전에 호출된다.
//     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "ShowWebView" {
//            let webViewController = segue.destination as! WebViewController
//            let myIndexPath = self.tableView.indexPathForSelectedRow!
//            let row = myIndexPath.row
//            webViewController.webSite = webAddresses[row]
//        }
//    }
    
    @IBAction func returned(segue: UIStoryboardSegue) {
        
    }
}
