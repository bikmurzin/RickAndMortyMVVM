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

extension LoginViewController {
    
    func configView() {
        view.addSubviews([signUpButton, loginButton, loginTextField, passwordTextField])
        view.backgroundColor = .mainBackgroundColor
        title = "Rick And Morty"
        configPasswordTextField()
        configLoginTextField()
        configLoginButton()
        configSignUpButton()
    }
    
    func configLoginTextField() {
        loginTextField.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextField.snp.top).offset(-10)
            make.width.centerX.height.equalTo(passwordTextField)
        }
        loginTextField.backgroundColor = .elementColor
        loginTextField.round()
        loginTextField.placeholder = " Email"
        
    }
    
    func configPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.centerY).offset(-20)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        passwordTextField.backgroundColor = .elementColor
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
