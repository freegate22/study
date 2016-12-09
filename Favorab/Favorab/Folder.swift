//
//  Folder.swift
//  Favorab
//
//  Created by na on 2016. 12. 8..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class Folder: Object {
    
    dynamic var id = 0
    dynamic var Name : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
