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
    
    
    
    
    var currentGame: VideoGame = VideoGame()
    var currentIndexPath: Int?
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        print("View Reloaded")
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell") as! GameTableCell
        currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        currentIndexPath = indexPath.row
        
        cell.gameNameLabel.text = currentGame.name
        cell.gameGenreLabel.text = currentGame.genre
        cell.gameRatingLabel.text = currentGame.rating
        
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
        currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        print(currentIndexPath!)
        print(currentGame.name)
    }
    
    
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        isSelected = false
        return indexPath
    }
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.checkedOut ? "Check In" : "Check Out"
        
        let titleAction = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            
            if title == "Check Out" {
                GameManager.sharedInstance.checkOutGame(at: indexPath.row)
                
                let currentCalendar = Calendar.current
                let twoWeek = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                let alert = UIAlertController(title: "", message: "You checked \(self.currentGame.name) out. The game is due \(dateFormatter.string(from: twoWeek!))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: { action in
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else if title == "Check In" {
                GameManager.sharedInstance.checkGameIn(at: indexPath.row)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                let alert = UIAlertController(title: "", message: "You checked \(self.currentGame.name) in on \(dateFormatter.string(from: Date()))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: { action in
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Status") { (_, _) in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "editScreen", sender: self)
        }
        showEditScreenAction.backgroundColor = gradientColors.lightGrey
        
        if title == "Check Out" {
            titleAction.backgroundColor = gradientColors.green
        } else if title == "Check In" {
            titleAction.backgroundColor = gradientColors.blue
        }
        
        return [deleteAction, titleAction, showEditScreenAction]
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
