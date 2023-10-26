//
//  HomeRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

import Alamofire

enum HomeRouter {
    case getUserinfo(token: String)
}

extension HomeRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getUserinfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUserinfo:
            return "/userinfo"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getUserinfo:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getUserinfo(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
