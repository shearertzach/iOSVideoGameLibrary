//
//  GameInfoManagerViewController.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import UIKit

class GameInfoManagerViewController: UIViewController {

    var currentGameIndex = 0
    var currentGame = VideoGame(name: "", rating: .E, genre: "")
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var checkedOutLabel: UILabel!
    @IBOutlet weak var checkInDateLabel: UILabel!
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }


    func load() {
        nameLabel.text = currentGame.name
        genreLabel.text = currentGame.genre
        RatingLabel.text = currentGame.rating.rawValue
        
        
        if currentGame.checkedOut == true {
            checkedOutLabel.text = currentGame.checkedOutDate
            checkInDateLabel.text = currentGame.dueDate

        } else {
            checkedOutLabel.text = "This game has not been checked out"
            checkInDateLabel.text = "This game has not been checked out"

        }
        
    }
    
    
   

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
