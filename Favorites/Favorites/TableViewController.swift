//
//  TableViewController.swift
//  Favorites
//
//  Created by na on 2016. 11. 21..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

var attractionNames: [String] = ["구글","네이버","다음","페이스북","유튜브"]
var shoppingList: [String] = ["Eggs", "Milk"]

var webAddresses: [String] = ["https://www.google.com","http://www.naver.com", "http://www.daum.net", "http://www.facebook.com", "http://www.youtube.com"]

class TableViewController: UITableViewController {

    @IBOutlet var folderListView: UITableView!
    
    var attractionImages = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        
        filestudy()
    }
    
    func filestudy(){
//        let filemgr = FileManager.default
        
//        // 파일 오프셋 이동, 바이트단위로 읽기
        let filepath1 = "/Users/na/c.txt"
        let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        
        if file == nil {
            print("file open failed")
        } else {
            
            let data = ("black dog" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            file?.seek(toFileOffset: 10)
            file?.write(data!)
            file?.closeFile()
        }
    }
    
    // 추가한 목록 불러오기
    override func viewWillAppear(_ animated: Bool) {
        folderListView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attractionNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
 
        cell.lblTitle.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.lblTitle.text = attractionNames[indexPath.row]
        
        cell.lblUrl.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.lblUrl.text = webAddresses[indexPath.row]
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowWebView" {
            let webViewController = segue.destination as! WebViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            webViewController.webSite = webAddresses[row]
        }
    }
 
    @IBAction func returned(segue: UIStoryboardSegue) {

    }

}
