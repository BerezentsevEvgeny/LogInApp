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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome,\(currentUser ?? "")!"
    }

}
