//
//  StartViewController.swift
//  CommandApp
//
//  Created by Rasikon on 14.09.2020.
//  Copyright © 2020 Rasikon. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var person: Person?
    
    // MARK: IBActions
    @IBAction func logInPressed() {
        guard
            userNameTextField.text == person?.login,
            passwordTextField.text == person?.password
            else {
                showAlert(title: "Invalid login or password",
                          message: "Please, enter correct login and password")
                clearFields()
                return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func savePerson(_ unwindSegue: UIStoryboardSegue){
        guard let registrationVC = unwindSegue.source as?
            RegistrationViewController else { return }
        person = registrationVC.person
        clearFields()
    }
    
    private func clearFields() {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controller
extension StartViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension StartViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}
