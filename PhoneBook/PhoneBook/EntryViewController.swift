//
//  EntryViewController.swift
//  PhoneBook
//
//  Created by na on 2016. 12. 8..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class EntryViewController: UIViewController {

    @IBOutlet weak var txtContactName: UITextField!
    @IBOutlet weak var txtContactPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionSaveData(_ sender: UIBarButtonItem) {
        saveContact()
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveContact(){
        let newContact = ContactItem()
        newContact.Name = txtContactName.text!
        newContact.PhoneNumber = txtContactPhone.text!
        do {
            let realm = try Realm()
            
            try realm.write( { () -> Void in
                try realm.add(newContact)
                print("Contact Saved ")
                
            })
        } catch {
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
