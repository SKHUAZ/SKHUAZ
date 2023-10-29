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
    case getDetailRootRecommend(token: String, rootrecommendID: Int)
    case postCreateRootRecommend(token: String, requestBody: CreateRecommendRequestBody)
    case delRootRecommend(token: String, recommendId: Int)
    case editRootRecommend(token: String, evaluationId: Int, requestBody: CreateRecommendRequestBody)
}

extension RootRecommendRouter: BaseTargetType {

    var baseURL: String { return Config.baseURL }

    var method: HTTPMethod {
        switch self {
        case .getAllRootRecommend:
            return .get

        case .getDetailRootRecommend:
            return .get
            
        case .postCreateRootRecommend:
            return .post
            
        case .delRootRecommend:
            return .delete
            
        case .editRootRecommend:
            return .put
        }
        
    }

    var path: String {
        switch self {
        case .getAllRootRecommend:
            return "/route/AllRoute"

        case .getDetailRootRecommend(_,let rootrecommendID):
            return "/route/details/\(rootrecommendID)"
            
        case .postCreateRootRecommend:
            return "/route/create"
            
        case .delRootRecommend(_,let recommendId):
            return "/evaluation/delete/\(recommendId)"
            
        case .editRootRecommend(_, let recommendId, _):
            return "/evaluation/edit/\(recommendId)"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .getAllRootRecommend:
            return .none

        case .getDetailRootRecommend:
            return .none
            
        case .postCreateRootRecommend:
            return .none
            
        case .delRootRecommend:
            return .none
            
        case .editRootRecommend(_, _, let requestBody):
            return .body(requestBody)
        }
    }

    var headers : HTTPHeaders?{
        switch self{
        case .getAllRootRecommend(let token):
            return ["Authorization": "Bearer \(token)"]
        case .getDetailRootRecommend(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .postCreateRootRecommend(let token, _):
            return ["Authorization": "Bearer \(token)"]
            
        case .delRootRecommend(let token, _):
            return ["Authorization": "Bearer \(token)"]
            
        case .editRootRecommend(let token, _, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }

}
