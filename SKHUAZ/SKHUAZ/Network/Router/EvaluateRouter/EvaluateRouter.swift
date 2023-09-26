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
    case getDetailEvaluation(token: String, evaluationId: Int)
    case postCreateEvaluation(token: String, requestBody: CreateEvaluateRequestBody)
}

extension EvaluateRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getAllEvaluation:
            return .get
        case .getDetailEvaluation:
            return .get
        case .postCreateEvaluation:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getAllEvaluation:
            return "/evaluation/AllEvaluation"
        case  .getDetailEvaluation(_,let evaluationId):
            return "/evaluation/content/\(evaluationId)"
        case .postCreateEvaluation:
            return "/evaluation/create"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getAllEvaluation:
            return .none
        case .getDetailEvaluation:
            return .none
        case .postCreateEvaluation(_, let requestBody):
            return .body(requestBody)
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getAllEvaluation(let token):
            return ["Authorization": "Bearer \(token)"]
        case .getDetailEvaluation(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .postCreateEvaluation(let token, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
