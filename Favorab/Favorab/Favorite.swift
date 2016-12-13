//
//  Favorite.swift
//  Favorab
//
//  Created by na on 2016. 12. 12..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import RealmSwift

class Favorite: Object {

    dynamic var id = 0
    dynamic var Name : String = ""
    dynamic var Tag : String = ""
    dynamic var Url : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
