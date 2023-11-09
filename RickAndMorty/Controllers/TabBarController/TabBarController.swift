////   /*
//
//  Project: RickAndMorty
//  File: TabBarController.swift
//  Created by: Robert Bikmurzin
//  Date: 08.11.2023
//
//  Status: in progress | Decorated
//
//  */

import UIKit
import Firebase

class TabBarController: UITabBarController {
    
    var handle: AuthStateDidChangeListenerHandle?
    var loginVC: LoginViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Инициализация наблюдателя аутентификации
        handle = Auth.auth().addStateDidChangeListener { _, user in
            if user == nil {
                self.loginVC = LoginViewController()
                self.loginVC?.modalPresentationStyle = .fullScreen
                self.present(self.loginVC ?? LoginViewController(), animated: false)
            } else {
            }
        }
    }
    
    private func setupTabs() {
        let home = createNavigation(title: "Home", image: UIImage(systemName: "house"), vc: MainViewController())
        let users = createNavigation(title: "Users", image: UIImage(systemName: "house"), vc: LogoutViewController())
        self.setViewControllers([home, users], animated: true)
    }
    
    private func createNavigation(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
