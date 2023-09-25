//
//  SceneDelegate.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let vc = SignUpViewController()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
