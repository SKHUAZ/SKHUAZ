//
//  RootRecommendRouter.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/25.
//

import Foundation
import Alamofire

enum RootRecommendRouter {
    case getAllRootRecommend(token: String)
    case getDetailRootRecommend(token: String)
}

extension RootRecommendRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getAllRootRecommend:
            return .get
            
        case .getDetailRootRecommend:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAllRootRecommend:
            return "/route/AllRoute"
            
        case .getDetailRootRecommend:
            return "/route/details/1"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getAllRootRecommend:
            return .none
            
        case .getDetailRootRecommend:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getAllRootRecommend(let token):
            return ["Authorization": "Bearer \(token)"]
        case .getDetailRootRecommend(let token):
            return ["Authorization": "Bearer \(token)"]
        default:
            return nil
        }
    }

}
