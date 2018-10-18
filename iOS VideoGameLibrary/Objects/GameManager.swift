//
//  GameManager.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation

class GameManager {
    
    static let sharedInstance = GameManager()
    
    
    private init() {
        
    }
    
    private var videoGameArray: [VideoGame] = [VideoGame(name: "Rainbow Six Siege", rating: .M, genre: "Shooter"), VideoGame(name: "Black Ops 4", rating: .M, genre: "Shooter"), VideoGame(name: "Fortnite", rating: .E, genre: "Battle Royale")]
    
    
    func getGameCount() -> Int {
        return videoGameArray.count
    }
    
    func getGame(at index: Int) -> VideoGame {
        return videoGameArray[index]
    }
    
    func addGame(game: VideoGame) {
        videoGameArray.append(game)
    }
    
    func removeGame(at index: Int) {
        videoGameArray.remove(at: index)
    }
    
    func checkOutGame(at index: Int) {
        let currentCalendar = Calendar.current
        let twoWeek = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        videoGameArray[index].checkedOut = true
        videoGameArray[index].checkedOutDate = dateFormatter.string(from: Date())
        videoGameArray[index].dueDate = dateFormatter.string(from: twoWeek!)
    }
    
    func checkGameIn(at index: Int) {
        videoGameArray[index].checkedOut = false
        
    }
    
    
    
    
}
