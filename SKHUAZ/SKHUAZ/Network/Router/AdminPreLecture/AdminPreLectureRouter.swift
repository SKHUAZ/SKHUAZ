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
}

extension AdminPreLectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .getAdminPreLecture:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAdminPreLecture:
            return "/all-prerequisites"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getAdminPreLecture:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .getAdminPreLecture(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
