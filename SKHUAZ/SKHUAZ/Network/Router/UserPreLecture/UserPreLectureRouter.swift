//
//  UserPreLectureRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

import Alamofire

enum UserPreLectureRouter {
    case postUserSelectLec(token: String, requestBody: SelectLecRequestBody)
    case getUserCheckLec(token: String, path: Int)
    case postUserCheckYN(token: String, requestBody: UserCheckYnRequestBody)
    case postUserPreLecture(token: String)
}

extension UserPreLectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .postUserSelectLec:
            return .post
        case .getUserCheckLec:
            return .get
        case .postUserCheckYN:
            return .post
        case .postUserPreLecture:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postUserSelectLec:
            return "/software/selectLec"
        case .getUserCheckLec(_, let path):
            return "/software/check/\(path)"
        case .postUserCheckYN:
            return "/software/updateCheckYn"
        case .postUserPreLecture:
            return "/preLecture/create"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postUserSelectLec(_, let requestBody):
            return .body(requestBody)
        case .getUserCheckLec:
            return .none
        case .postUserCheckYN(_, let requestBody):
            return .body(requestBody)
        case .postUserPreLecture:
            return .none
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .postUserSelectLec(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .getUserCheckLec(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .postUserCheckYN(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .postUserPreLecture(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
