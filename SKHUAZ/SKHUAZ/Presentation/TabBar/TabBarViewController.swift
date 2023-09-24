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
        setFirstViewContoller()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension TabBarController {
    
    private func setFirstViewContoller() {
        if let homeVC = tabs.firstIndex(where: { $0 is UIViewController }) {
              selectedIndex = homeVC
          } // 지금은 강의평 화면을 기본 셋팅화면으로 설정
    }
    
    private func setTabBarItems() {
        tabs = [
            EssentialViewController(), // 선수과목
            EvaluateViewController(), // 강의평
            UIViewController(), // 홈
            RecommendViewController(), // 루트추천
            SettingViewController() // 설정
        ]
        TabBarItemType.allCases.forEach {
            let tabBarItem = $0.setTabBarItem()
            tabs[$0.rawValue].tabBarItem = tabBarItem
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarUI() {
        tabBar.backgroundColor = UIColor(hex: "#FFFFFF")
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 0.7
        tabBar.tintColor = UIColor(hex: "#9AC1D1")
    }
}
