//
//  AdminPreLectureRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

import Alamofire

enum AdminPreLectureRouter {
    case getAdminPreLecture(token: String)
    case postAddAdminPreLecture(token: String, requestBody: AddAdminPreLectureRequestBody)
}

extension AdminPreLectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getAdminPreLecture:
            return .get
        case .postAddAdminPreLecture:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getAdminPreLecture:
            return "/software/all-prerequisites"
        case .postAddAdminPreLecture:
            return "/software/add-preLecture"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getAdminPreLecture:
            return .none
        case .postAddAdminPreLecture(_, let requestBody):
            return .body(requestBody)
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getAdminPreLecture(let token):
            return ["Authorization": "Bearer \(token)"]
        case .postAddAdminPreLecture(let token, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
