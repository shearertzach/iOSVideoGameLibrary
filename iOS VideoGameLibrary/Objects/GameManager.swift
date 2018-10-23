//
//  GameManager.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation
import RealmSwift

class GameManager {
    
    static let sharedInstance = GameManager()
    
    
    private init() {
        videoGameArray = realm.objects(VideoGame.self)
    }
    
    private var videoGameArray: Results<VideoGame>!
    
    let realm = try! Realm()
    
    
    func getGameCount() -> Int {
        return videoGameArray.count
    }
    
    func getGame(at index: Int) -> VideoGame {
        return videoGameArray[index]
    }
    
    func addGame(game: VideoGame) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    func checkOutGame(at index: Int) {
        
        let currentCalendar = Calendar.current
        let twoWeek = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        
        try! realm.write {
            
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            videoGameArray[index].checkedOut = true
            videoGameArray[index].checkedOutDate = dateFormatter.string(from: Date())
            videoGameArray[index].dueDate = dateFormatter.string(from: twoWeek!)
        }
    }
    
    func checkGameIn(at index: Int) {
        try! realm.write {
            videoGameArray[index].checkedOut = false
        }
        
    }
    
    
    
    
}
