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
    case getPreLecture(token: String)
}

extension preLectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .postPreLecture:
            return .post
        case .getPreLecture:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .postPreLecture:
            return "/preLecture/create"
        case .getPreLecture:
            return "/preLecture/check"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postPreLecture(_, let requestBody):
            return .body(requestBody)
        case .getPreLecture:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .postPreLecture(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .getPreLecture(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
