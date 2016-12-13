//
//  InputViewController.swift
//  Favorab
//
//  Created by na on 2016. 12. 12..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {

    @IBOutlet weak var textTag: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTag(_ sender: UIButton) {
        saveFavorite()
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveFavorite(){
        let favorite = Favorite()
        favorite.Name = textTag.text!
        favorite.Tag = textName.text!
        favorite.Url = textURL.text!

        do {
            let realm = try Realm()
            
            try realm.write( { () -> Void in
                realm.add(favorite)
                print("Contact Saved \(favorite.Url)")
                
            })
            
            // 태그가 있는지 보고 없으면 추가
            
        } catch {
            
        }
    }
    
    
//    func saveFolder(name: String){
//        let realm = try! Realm()
//        
//        var maxValue =  realm.objects(Folder.self).max(ofProperty: "id") as Int?
//        if maxValue == nil {
//            maxValue = 0
//        }
//        
//        let folder = Folder()
//        folder.Name = name
//        folder.id = maxValue! + 1
//        
//        try! realm.write {
//            realm.add(folder)
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