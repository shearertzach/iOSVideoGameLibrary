//
//  Game.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation
import RealmSwift



class VideoGame: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var rating: String = ""
    @objc dynamic var dueDate: String = ""
    @objc dynamic var checkedOut: Bool = false
    @objc dynamic var genre: String = ""
    @objc dynamic var checkedOutDate: String = ""
    
    
    
    
}
