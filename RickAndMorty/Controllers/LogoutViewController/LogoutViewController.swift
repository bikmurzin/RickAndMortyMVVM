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
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        logoutButton.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        logoutButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        logoutButton.backgroundColor = .elementColor
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addWhiteShadow()
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
