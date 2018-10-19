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
    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var checkInButton: UIButton!
    


    
    
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
            checkOutButton.isEnabled = false
            checkInButton.isEnabled = true
        } else {
            checkedOutLabel.text = "This game has not been checked out"
            checkInDateLabel.text = "This game has not been checked out"
            checkInButton.isEnabled = false
            checkOutButton.isEnabled = true
        }
        
    }
    
    
   
    @IBAction func checkOutPressed(_ sender: Any) {
        let currentCalendar = Calendar.current
        let twoWeek = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let alert = UIAlertController(title: "", message: "You checked \(currentGame.name) out. The game is due \(dateFormatter.string(from: twoWeek!))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)

        GameManager.sharedInstance.checkOutGame(at: currentGameIndex)
        load()
        
    }
    
    
    @IBAction func checkInPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let alert = UIAlertController(title: "", message: "You checked \(currentGame.name) in on \(dateFormatter.string(from: Date()))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
        GameManager.sharedInstance.checkGameIn(at: currentGameIndex)
        load()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
