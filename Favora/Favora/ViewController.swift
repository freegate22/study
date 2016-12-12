//
//  ViewController.swift
//  Favora
//
//  Created by na on 2016. 11. 29..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

var folderNames: [String] = ["포털","블로그","카페","쇼핑몰","기타"]
var siteNames = ["Yahoo","Google","Apple","Bing","nate","Yahoo","Google","Apple","Bing","nate","Yahoo","Google","Apple","Bing","nate"]
var siteAddresses = ["https://www.yahoo.com","https://www.google.com","https://www.apple.com","https://www.bing.com","https://www.nate.com","https://www.yahoo.com","https://www.google.com","https://www.apple.com","https://www.bing.com","https://www.nate.com","https://www.yahoo.com","https://www.google.com","https://www.apple.com","https://www.bing.com","https://www.nate.com"]

var count = 3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tbvFolder: UITableView!
    @IBOutlet var edit: UIBarButtonItem!
    
    var datasourceFolder : Results<Folder>
    var datasourceSite : Results<Site>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        reloadTheTable()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadTheTable(){
        addSample()
        let realm = try! Realm()
        datasourceFolder = realm.objects(Folder)
        datasourceSite = realm.objects(Site)
        tbvFolder?.reloadData()
 
        
    }
    
    func addSample(){
        let folder = Folder()
        folder.Name = "정치"

        let site = Site()
        site.Name = "야후"
        site.Url = "https://www.yahoo.com"
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(folder)
            realm.add(site)
        }
        
    }
    
    func queryPeople(){
        
        let realm = try! Realm()
        
        let allPeople = realm.objects(Human.self)
        
        //        var filteredPeople = allPeople.filter("age > 21")
        //        var filteredPeople = allPeople.filter("name BEGINSWITH 'A'")
        //        let filteredPeople = allPeople.filter("age == 13")
        
        let filteredPeople = allPeople.sorted(byProperty: "name", ascending: true)
        
        for person in filteredPeople {
            People.append(person.name)
            Ages.append("\(person.age)")
            Races.append(person.race)
            
            print("\(person.name) is \(person.age) years old")
            
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let identifier: String = nil
        if( indexPath.section == 0 ){
            identifier = "FolderTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            }
            let currentFolder = datasource[indexPath.row]
            cell?.textLabel?.text = currentFolder.Name
        } else {
            identifier = "SiteTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            }
            let currentSite = datasource[indexPath.row]
            cell?.textLabel?.text = currentSite.Name
            cell?.detailTextLabel?.text = currentSite.Url
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return datasourceFolder.count
        } else {
            return datasourceSite.count
        }
        
    }

    
//    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("edit")
        if editingStyle == .delete {
            // Delete the row from the data source
            folderNames.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } else {
            print("else")
        }
    }
//
//    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "삭제"
//    }
//    
//    // Override to support rearranging the table view.
//    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        
//        let itemToMove = folderNames[fromIndexPath.row]
//        
//        folderNames.remove(at: fromIndexPath.row)
//        folderNames.insert(itemToMove, at: to.row)
//        
//    }
//    
//    func setEditing(editing: Bool, animated: Bool) {
//        super.setEditing(editing, animated: animated)
//        tbvFolder.setEditing(editing, animated: animated)
//        if (editing) {
//            print("1")
//            // you might disable other widgets here... (optional)
//        } else {
//            print("2")
//            // re-enable disabled widgets (optional)
//        }
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "폴더"
        } else {
            return "site"
        }
    }

    @IBAction func doEdit(_ sender: UIBarButtonItem) {
        if (tbvFolder.isEditing) {
            edit.title = "수정"
            tbvFolder.setEditing(false, animated: true)
        } else {
            edit.title = "확인"
            tbvFolder.setEditing(true, animated: true)
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
                print("\n\(enteredText)")
                self.savaData(name: enteredText!)
//                folderNames.append(enteredText!)
                self.tbvFolder.reloadData()
            }
            
            
            print("Ok Button was Pressed")
        })
        
        alert.addTextField(){
            (textField) in textField.placeholder = "폴더명"
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { (notification) in
                print("\(textField.text)")
                okAction.isEnabled = textField.text != ""
            }
            
        }

        okAction.isEnabled = false
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: false, completion: nil)
        
    }

}
