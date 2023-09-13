//
//  TabBarItem.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/01.
//


import UIKit

enum TabBarItemType: Int, CaseIterable {
    case precedence
    case evaluate
    case home
    case recommend
    case setting
}

extension TabBarItemType {
    
    var title: String {
        switch self {
   
        case .precedence:
            return "선수과목"
        case .evaluate:
            return "강의평"
        case .home:
            return "홈"
        case .recommend:
            return "루트추천"
        case .setting:
            return "설정"
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .precedence:
            return Image.precedence
        case .evaluate:
            return Image.evaluate
        case .home:
            return Image.home
        case .recommend:
            return Image.recommend
        case .setting:
            return Image.setting
        }
    }

    var unSelectedIcon: UIImage {
        switch self {
        case .precedence:
            return Image.precedence
        case .evaluate:
            return Image.evaluate
        case .home:
            return Image.home
        case .recommend:
            return Image.recommend
        case .setting:
            return Image.setting
        }
    }
    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: title, image: unSelectedIcon, selectedImage: selectedIcon)
    }
}
