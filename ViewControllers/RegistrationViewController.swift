//
//  RegistrationViewController.swift
//  CommandApp
//
//  Created by Rasikon on 14.09.2020.
//  Copyright © 2020 Rasikon. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var person: Person?
    
    @IBAction func createUser() {
        addPerson()
        loginTextField.text = ""
        nameTextField.text = ""
        surnameTextField.text = ""
        passwordTextField.text = ""
        emailTextField.text = ""
    }
    
    private func addPerson() {
        guard
            let login = loginTextField.text,
            let name = nameTextField.text,
            let surname = surnameTextField.text,
            let password = passwordTextField.text,
            let email = emailTextField.text
            else { return }
        if login.isEmpty || name.isEmpty ||
            surname.isEmpty || password.isEmpty ||
            email.isEmpty {
            showAlert(title: "Warning!", message: "All fields must be filled")
        } else {
            person = Person(login: login, name: name, surname: surname,
                            password: password, email:email)
            showAlert(title: "Welcome!", message: "New user created")
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension RegistrationViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
