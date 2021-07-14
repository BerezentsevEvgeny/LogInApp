//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Евгений Березенцев on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var currentUser: String!
    
    var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome,\(currentUser ?? "")!"
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    

}
