//
//  MainMenuViewController.swift
//  iOS VideoGameLibrary
//
//  Created by Zach Shearer on 10/17/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//
import Foundation
import UIKit

class MainMenuViewController: UIViewController, CAAnimationDelegate {
    
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    var isActive = true
    
    let gradientOne = UIColor.red.cgColor
    let gradientTwo = gradientColors.darkGrey.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLabel.alpha = 0.0
        firstButton.alpha = 0.0
        secondButton.alpha = 0.0
        thirdButton.alpha = 0.0
        startUp()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientOne])
        
        
        gradient.frame = colorView.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0.5, y:1)
        gradient.endPoint = CGPoint(x:0.5, y:0)
        gradient.drawsAsynchronously = true
        colorView.layer.insertSublayer(gradient, below: thirdButton.layer)
        
        
        animateGradient()
        
    }
    
    func animateGradient() {
        
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.delegate = self
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
        

    }
    
    
     func animationDidStart(_ anim: CAAnimation) {
        print("Animation Started")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag == true {
            print("animation complete")
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    let colorArray: [UIColor] = [UIColor.lightGray, .darkGray]
    
    
    
    
    
    
    
    
    func startUp() {
        UIView.animate(withDuration: 2,  animations: {
            self.startLabel.alpha = 1.0
            self.firstButton.alpha = 1.0
            self.secondButton.alpha = 1.0
            self.thirdButton.alpha = 1.0
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func unwindToMainMenu(_ sender: UIStoryboardSegue) {}
    
    
    
}






