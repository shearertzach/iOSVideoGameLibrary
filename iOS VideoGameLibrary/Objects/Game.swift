//
//  Game.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation

enum Rating: String {
    case E = "Everyone"
    case E10 = "Everyone 10+"
    case T = "Teen"
    case M = "Mature"
    case AO = "Adults Only"
}

class VideoGame {
    
    var name: String
    var rating: Rating
    var dueDate: String
    var checkedOut: Bool
    var genre: String
    var checkedOutDate: String
    
    
    
    init(name: String, rating: Rating, genre: String) {
        self.name = name
        self.rating = rating
        self.dueDate = ""
        self.checkedOut = false
        self.genre = genre
        self.checkedOutDate = ""
    }
    
    
    
    
    
}
