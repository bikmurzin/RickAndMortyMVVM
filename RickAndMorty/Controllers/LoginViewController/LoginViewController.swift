////   /*
//
//  Project: RickAndMorty
//  File: AuthorizationViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 07.11.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var signUpButton = UIButton()
    var loginButton = UIButton()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Инициализация наблюдателя аутентификации
        handle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            if user == nil {
//                self.navigationController?.popToRootViewController(animated: true)
            } else {
//                self.navigationController?.pushViewController(LogoutViewController(), animated: true)
                self?.loginTextField.text = nil
                self?.passwordTextField.text = nil
                self?.dismiss(animated: true)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Удаление слушателя
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    
    @objc func loginButtonAction() {
        guard
            let email = loginTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(
                    title: "Sign In Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func signUpButtonAction() {
        guard
            let email = loginTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            // аутентификация после успешного создания нового пользователя
            if error == nil {
                Auth.auth().signIn(withEmail: email, password: password)
            } else {
                print("Error in createUser: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
