//
//  FavoriteViewController.swift
//  Favorab
//
//  Created by na on 2016. 12. 12..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewFavorite: UITableView!
    
    var datasourceFavorite : Results<Favorite>!
    var tag: String?

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.tableViewFavorite.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFavorite.delegate = self
        tableViewFavorite.dataSource = self
        tableViewFavorite.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "FavoriteCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveItem(selectedFolder: Folder){
        do {
            let realm = try Realm()
            let favoriteObj = realm.objects(Favorite.self)
            datasourceFavorite = favoriteObj.filter("Name == '\(selectedFolder.Name)'")
        } catch {
            
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let identifier: String = "FavoriteCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! FavoriteTableViewCell
        let currentFavorite = datasourceFavorite[indexPath.row]
        cell.textLabel?.text = currentFavorite.Name
        cell.detailTextLabel?.text = currentFavorite.Url

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceFavorite.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "sgWebView", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgWebView" {
            let webViewController = segue.destination as! WebViewController
            let myIndexPath = self.tableViewFavorite.indexPathForSelectedRow!
            let row = myIndexPath.row
            webViewController.webSite = datasourceFavorite[row].Url
        } else if segue.identifier == "sgInput" {
            let inputViewController = segue.destination as! InputViewController
            inputViewController.tag = tag
        }
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            alertDelete(indexPath: indexPath)
//            
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        } else {
//            
//        }
//    }
//    
//    func alertDelete(indexPath: IndexPath){
//        let alert = UIAlertController(title: nil, message: "선택한 폴더를 삭제하시겠습니까?", preferredStyle: .alert)
//        
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        
//        let okAction = UIAlertAction(title: "삭제", style: .default, handler: {
//            (action) -> Void in
//            
//            let folder = self.datasourceFavorite[indexPath.row]
//            
//            let realm = try! Realm()
//            try! realm.write {
//                realm.delete(folder)
//            }
//            self.tableview.deleteRows(at: [indexPath], with: .fade)
//        })
//        
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//        
//        self.present(alert, animated: false, completion: nil)
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "폴더"
//        } else {
//            return "최근 방문한 사이트"
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        //        let vcName = "FavoriteVC"
//        //        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
//        //        self.navigationController?.pushViewController(viewController!, animated: true)
//        //        performSegue(withIdentifier: "goToEntryVC", sender: nil)
//        print("Selected row at \(indexPath.row)")
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "sgFavorite" {
//            let cell = sender as! UITableViewCell
//            let indexPath = self.tableview.indexPath(for: cell)
//            let favoriteView = segue.destination as! FavoriteViewController
//            favoriteView.receiveItem(item: self.datasourceFolder[(indexPath?.row)!])
//        }
//    }

    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
