//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by na on 2016. 11. 28..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var status: UILabel!
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Contacts",
                                       in: managedObjectContext)
        
        let contact = Contacts(entity: entityDescription!,
                               insertInto: managedObjectContext)
        
        contact.name = name.text!
        contact.address = address.text!
        contact.phone = phone.text!
        
        do {
            try managedObjectContext.save()
            name.text = ""
            address.text = ""
            phone.text = ""
            status.text = "Contact Saved"
            
        } catch let error {
            status.text = error.localizedDescription
        }
        
    }
    
    @IBAction func find(_ sender: UIButton) {
        
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Contacts",
                                       in: managedObjectContext)
        
        let request: NSFetchRequest<Contacts> = Contacts.fetchRequest()
        request.entity = entityDescription
        
        let pred = NSPredicate(format: "(name = %@)", name.text!)
        request.predicate = pred
        
        do {
            var results =
                try managedObjectContext.fetch(request as!
                    NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                let match = results[0] as! NSManagedObject
                
                name.text = match.value(forKey: "name") as? String
                address.text = match.value(forKey: "address") as? String
                phone.text = match.value(forKey: "phone") as? String
                status.text = "Matches found: \(results.count)"
            } else {
                status.text = "No Match"
            }
            
        } catch let error {
            status.text = error.localizedDescription
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

