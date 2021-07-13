//
//  ViewController.swift
//  LogInApp
//
//  Created by Евгений Березенцев on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let userName = "User"
    private let userPassword = "123456789"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.currentUser = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        goToWelcomeScreen(sender: sender)
    }
    
    @IBAction func forgotNameTapped() {
        let alert = UIAlertController(title: "Oops!", message: "Your name is \(userName)🤫", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordTapped() {
        let alert = UIAlertController(title: "Oops!", message: "Your password is \(userPassword)🤫", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    

    
    
}

// Переход на второй экран по нажатию кнопки Done
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goToWelcomeScreen(sender: textField)
        return true
    }
}

// Метод для перехода на второй экран
extension LoginViewController {
    
    private func goToWelcomeScreen(sender: Any?) {
        guard userNameTF.text == userName, passwordTF.text == userPassword else { wrongDataAlert()
                                                                                  return }
        performSegue(withIdentifier: "mainSegue", sender: sender)
    }
    
    
    
    private func wrongDataAlert() {
        let alert = UIAlertController(title: "Invalid login or password", message: "Please,enter correct login and password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



