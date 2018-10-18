//
//  AddGameViewController.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var gameDescriptionTextField: UITextField!
    @IBOutlet weak var gameRatingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var gameGenrePickerView: UIPickerView!
    
    //Array holding the different genres our games can have
    let genres = ["Action", "RPG", "Platformer", "Survival", "Shooter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = gameTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = gameDescriptionTextField.text, gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            //Show an error and return
            return
        }
        
        var rating: Rating!
        
        switch gameRatingSegmentedControl.selectedSegmentIndex {
        case 0:
            rating = .E
        case 1:
            rating = .E10
        case 2:
            rating = .T
        case 3:
            rating = .M
        case 4:
            rating = .AO
        default:
            rating = .E
        }
        
        let genre = genres[gameGenrePickerView.selectedRow(inComponent: 0)]
        
        let newGame = VideoGame(name: title, rating: rating, genre: genre)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToMainMenu", sender: self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


    
    
    
    
}

