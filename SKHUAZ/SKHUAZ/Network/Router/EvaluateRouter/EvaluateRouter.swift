//
//  EvaluateRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/22.
//

import Foundation

import Alamofire

enum EvaluateRouter {
    case getAllEvaluation(token: String)
}

extension EvaluateRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getAllEvaluation:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAllEvaluation:
            return "/evaluation/AllEvaluation"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getAllEvaluation:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getAllEvaluation(let token):
            return ["Authorization": "Bearer \(token)"]
        default:
            return nil
        }
    }

}
