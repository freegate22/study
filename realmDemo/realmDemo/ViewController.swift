//
//  ViewController.swift
//  realmDemo
//
//  Created by na on 2016. 12. 7..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addHuman()
        queryPeople()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addHuman(){
        let mike = Human()
        mike.name = "Alex"
        mike.age = 45
        mike.race = "Indian"


        
        let realm = try! Realm()
        try! realm.write {
            realm.add(mike)
            print("Added \(mike.name)")
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
            print("\(person.name) is \(person.age) years old")
        }
    }
}

