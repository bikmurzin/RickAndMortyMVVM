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
                self.setupTabs()
            }
        }
    }
    
    private func setupTabs() {
        let home = createNavigation(title: "Characters", image: UIImage(systemName: "house"), vc: MainViewController())
        let users = createNavigation(title: "Logout", image: UIImage(systemName: "person"), vc: LogoutViewController())
        self.setViewControllers([home, users], animated: true)
    }
    
    private func createNavigation(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
