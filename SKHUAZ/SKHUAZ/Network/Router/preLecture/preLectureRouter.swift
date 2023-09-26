//
//  preLectureRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/22.
//

import Foundation

import Alamofire

enum preLectureRouter {
    case postPreLecture(token: String, requestBody: [PreLectureRequestBody])
}

extension preLectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .postPreLecture:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postPreLecture:
            return "/preLecture/create"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postPreLecture(_, let requestBody):
            return .body(requestBody)
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .postPreLecture(let token, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
