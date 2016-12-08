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
    
    var datasourceFolder : Results<Folder>!
    var datasourceSite : Results<Site>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        reloadTheTable()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadTheTable(){
        let realm = try! Realm()
        datasourceFolder = realm.objects(Folder.self)
        datasourceSite = realm.objects(Site.self)
        tableview?.reloadData()
        
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
            return cell!
            
        } else {
            let identifier: String = "SiteTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            }
            let currentSite = datasourceSite[indexPath.row]
            cell?.textLabel?.text = currentSite.Name
            cell?.detailTextLabel?.text = "asdf"
            return cell!
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
//        if section == 0 {
//            return datasourceFolder.count
//        } else {
//            return datasourceSite.count
//        }
        
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
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "폴더"
//        } else {
//            return "site"
//        }
//    }
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
    
}

