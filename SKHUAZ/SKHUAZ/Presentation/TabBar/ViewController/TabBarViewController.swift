//
//  TabBarViewController.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarUI()
        setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension TabBarController {
    
    private func setTabBarItems() {
        
        tabs = [
            LoginViewController(),
            EvaluateViewController()
        ]
        TabBarItemType.allCases.forEach {
            let tabBarItem = $0.setTabBarItem()
            tabs[$0.rawValue].tabBarItem = tabBarItem
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarUI() {
        tabBar.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 0.7
        tabBar.tintColor = .blue
    }
}
