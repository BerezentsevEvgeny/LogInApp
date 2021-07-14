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
    private let userPassword = "12345"
    
    
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
        presentWelcomeScreen(sender: sender)
    }
    
    @IBAction func forgotNameTapped() {
        presentAlert(title: "Oops!", message: "Your name is \(userName)🤫")
    }
    
    @IBAction func forgotPasswordTapped() {
        presentAlert(title: "Oops!", message: "Your password is \(userPassword)🤫")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}


extension LoginViewController: UITextFieldDelegate {
    // Переход на второй экран по нажатию кнопки Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presentWelcomeScreen(sender: textField)
        return true
    }
}

extension LoginViewController {
    // Метод для перехода на второй экран
    private func presentWelcomeScreen(sender: Any?) {
        if userNameTF.text == userName, passwordTF.text == userPassword {
            performSegue(withIdentifier: "mainSegue", sender: sender)
        } else {
            presentAlert(title: "Invalid login or password", message: "Please,enter correct login and password")
            passwordTF.text = ""
        }
    }
}

extension LoginViewController {
    // Метод Alert
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



