////   /*
//
//  Project: RickAndMorty
//  File: LogoutViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 07.11.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import SnapKit
import Firebase

class LogoutViewController: UIViewController {
    
    var logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configView() {
        view.backgroundColor = .mainBackgroundColor
        view.addSubview(logoutButton)
        configLogoutButton()
    }
    
    func configLogoutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
    }
    
    @objc func logoutAction() {
        print("Logout")
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Auth sign out failed: \(error)")
        }
    }
}
