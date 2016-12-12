//
//  ViewController.swift
//  Favorab
//
//  Created by na on 2016. 12. 8..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var itemEdit: UIBarButtonItem!

    var datasourceFolder : Results<Folder>!
    var datasourceSite : Results<Site>!
    
//    override func viewWillAppear(_ animated: Bool){
//        super.viewWillAppear(animated)
//        reloadTheTable()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        migration()
        tableview.delegate = self
        tableview.dataSource = self
        reloadTheTable()
    }

    func migration(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                migration.enumerateObjects(ofType: Folder.className()) { oldObject, newObject in }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///////////////////////////
    // table view
    ///////////////////////////
    func reloadTheTable(){
        let realm = try! Realm()
        datasourceFolder = realm.objects(Folder.self)
        datasourceSite = realm.objects(Site.self)
        tableview?.reloadData()
        
        print("Count - \(datasourceFolder.count)")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if( indexPath.section == 0 ){
            let identifier: String = "FolderTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)


            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            }
            let currentFolder = datasourceFolder[indexPath.row]
            cell?.textLabel?.text = currentFolder.Name

            print("c=\(currentFolder.id) row=\(indexPath.row)")
            return cell!
            
        } else {
            let identifier: String = "SiteTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            }
            let currentSite = datasourceSite[indexPath.row]
            cell?.textLabel?.text = currentSite.Name
            cell?.detailTextLabel?.text = currentSite.Url
            return cell!
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return datasourceFolder.count
        } else {
            return datasourceSite.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let folder = datasourceFolder[indexPath.row]
            
            let realm = try! Realm()
            try! realm.write {
                realm.delete(folder)
            }
            tableview.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } else {

        }
    }
    
    // 셀 높이 조절
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
//        return 50
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
//        return 30
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
//        return 0
//    }
//    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "태그"
        } else {
            return "최근 방문한 사이트"
        }
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
//        myHeader.backgroundColor = UIColor.yellow
//        return myHeader
//    }

//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let myHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
//        myHeader.backgroundColor = UIColor.purple
//        return myHeader
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Selected row at \(indexPath.row)")
    }
    
    ///////////////////////////
    // realm
    ///////////////////////////
    
    func saveFolder(name: String){
        let realm = try! Realm()
        
        var maxValue =  realm.objects(Folder.self).max(ofProperty: "id") as Int?
        if maxValue == nil {
            maxValue = 0
        }
        
        let folder = Folder()
        folder.Name = name
        folder.id = maxValue! + 1

        try! realm.write {
            realm.add(folder)
        }
    }
    
    func removeFolder(id: Int){
        let folder = datasourceFolder[id]
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(folder)
        }
    }
    
    func removeAll(){
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    ///////////////////////////
    // action
    ///////////////////////////
    
    @IBAction func doEdit(_ sender: UIBarButtonItem) {
        if (tableview.isEditing) {
            itemEdit.title = "수정"
            tableview.setEditing(false, animated: true)
        } else {
            itemEdit.title = "확인"
            tableview.setEditing(true, animated: true)
        }
    }
    
    @IBAction func btnNewFolder(_ sender: UIButton) {

        let alert = UIAlertController(title: "새로운 폴더", message: "이 폴더의 이름을 입력하십시오.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: {
            (action) -> Void in
            if let textFields = alert.textFields {
                let theTextFields = textFields
                let enteredText = theTextFields[0].text
                self.saveFolder(name: enteredText!)
                self.tableview.insertRows(at: [IndexPath.init(row: self.datasourceFolder.count-1, section: 0)], with: .automatic)
            }
        })
        
        alert.addTextField(){
            (textField) in textField.placeholder = "폴더명"
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { (notification) in
                okAction.isEnabled = textField.text != ""
            }
            
        }
        
        okAction.isEnabled = false
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: false, completion: nil)

    }
    
    
}

