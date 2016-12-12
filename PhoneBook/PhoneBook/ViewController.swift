//
//  ViewController.swift
//  PhoneBook
//
//  Created by na on 2016. 12. 7..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var datasource : Results<ContactItem>!
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        reloadTheTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSample()
        self.setupUI()
        reloadTheTable()
    }
    
    func addSample(){
        let folder = ContactItem()
        folder.Name = "정치"
        folder.PhoneNumber = "111-222"

        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(folder)
            }
        } catch {
            print("error")
        }
        
    }
    
    func reloadTheTable(){
        do {
            let realm = try Realm()
            datasource = realm.objects(ContactItem.self)
            tableView?.reloadData()
            print(datasource.count)
        } catch {
            
        }
        
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // DataSOurce delegation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return datasource.count
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
        
        let currentContactInfo = datasource[indexPath.row]
        cell?.textLabel?.text = currentContactInfo.Name
        cell?.detailTextLabel?.text = currentContactInfo.PhoneNumber
        //        cell?.textLabel?.text = "Row \(indexPath.row)"
        //        cell?.detailTextLabel?.text = "\(Date())"
        return cell!
    }
    
    // 셀 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        myHeader.backgroundColor = UIColor.yellow
        return myHeader
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let myHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        myHeader.backgroundColor = UIColor.purple
        return myHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Selected row at \(indexPath.row)")
    }
    
    
    @IBAction func gotoEntryVC(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToEntryVC", sender: nil)
    }
    
    
    
    
}


