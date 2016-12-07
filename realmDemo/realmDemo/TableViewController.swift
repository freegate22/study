//
//  TableViewController.swift
//  realmDemo
//
//  Created by na on 2016. 12. 7..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var People = [String]()
    var Ages = [String]()
    var Races = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        queryPeople()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return People.count
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        // Configure the cell...

        cell.NameLabel.text = People[indexPath.row]
        cell.SubLabel.text = "\(Races[indexPath.row]), \(Ages[indexPath.row])"

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
