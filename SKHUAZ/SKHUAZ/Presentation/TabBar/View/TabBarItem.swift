//
//  TabBarItem.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/01.
//


import UIKit

enum TabBarItemType: Int, CaseIterable {
    case home
    case myPage
}

extension TabBarItemType {
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .myPage:
            return "마이페이지"
        }
    }

    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: title, image: UIImage(named: "pencil"), selectedImage: UIImage(named: "eraser"))
    }
}
