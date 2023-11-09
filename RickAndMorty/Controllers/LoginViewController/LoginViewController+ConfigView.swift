////   /*
//
//  Project: RickAndMorty
//  File: AuthorizationViewController+ConfigView.swift
//  Created by: Robert Bikmurzin
//  Date: 07.11.2023
//
//  Status: in progress | Decorated
//
//  */

import Foundation
import SnapKit
import UIKit

extension LoginViewController {
    
    func configView() {
        view.addSubviews([imageView, signUpButton, loginButton, loginTextField, passwordTextField])
        view.backgroundColor = .mainBackgroundColor
        title = "Rick And Morty"
        configImageView()
        configPasswordTextField()
        configLoginTextField()
        configLoginButton()
        configSignUpButton()
        addTapGesture()
    }
    
    /// Добавляет распознавание тапа по экрану, чтобы скрыть клавиатуру
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector (UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func configImageView() {
        imageView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        imageView.image = .launch
        imageView.contentMode = .scaleAspectFill
    }
    
    func configLoginTextField() {
        loginTextField.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextField.snp.top).offset(-10)
            make.width.centerX.height.equalTo(passwordTextField)
        }
        loginTextField.backgroundColor = .elementColor
        loginTextField.alpha = 0.9
        loginTextField.round()
        loginTextField.placeholder = " Email"
        
    }
    
    func configPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.centerY)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        passwordTextField.backgroundColor = .elementColor
        passwordTextField.alpha = 0.9
        passwordTextField.round()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = " Password"
    }
    
    func configLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(70)
            make.width.centerX.equalTo(passwordTextField)
            make.height.equalTo(50)
        }
        loginButton.backgroundColor = .elementColor
        loginButton.addWhiteShadow()
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    func configSignUpButton() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(40)
            make.width.centerX.equalTo(passwordTextField)
            make.height.equalTo(30)
        }
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
}
