//
//  GameLibraryViewController.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIBarButtonItem!
    

    
    
    var currentGame: VideoGame = VideoGame(name: "", rating: .E, genre: "")
    var currentIndexPath: Int?
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        submitButton.isEnabled = false
        print("View Reloaded")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    


    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell") as! GameTableCell
        currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        currentIndexPath = indexPath.row
        _ = currentGame
        cell.gameNameLabel.text = currentGame.name
        cell.gameGenreLabel.text = currentGame.genre
        cell.gameRatingLabel.text = currentGame.rating.rawValue
        
        if currentGame.checkedOut == true {
            cell.gameView.backgroundColor = UIColor.red
        } else {
            cell.gameView.backgroundColor = UIColor.green
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath) as! GameTableCell
        currentIndexPath = indexPath.row
        isSelected = true
        submitButton.isEnabled = true
        currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        print(currentIndexPath!)
        print(currentGame.name)
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        isSelected = false
        submitButton.isEnabled = false
        return indexPath
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.submitButton.isEnabled = false
        }
        
        return [deleteAction]
    }
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? GameInfoManagerViewController {
            destVC.currentGameIndex = currentIndexPath!
            destVC.currentGame = currentGame
            print(currentIndexPath!)
            print(currentGame.name)
        }
    }
    

}
