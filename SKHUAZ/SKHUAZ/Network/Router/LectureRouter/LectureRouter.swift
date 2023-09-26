//
//  LectureRouter.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import Foundation

import Alamofire

enum LectureRouter {
    case postSmesters(token: String)
    case postAllLecture(token: String, requestBody: AllLectureRequestBody)
    case postAllProfessor(token: String, requestBody: AllProfessorRequestBody)
}

extension LectureRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .postSmesters:
            return .post
        case .postAllLecture:
            return .post
        case .postAllProfessor:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postSmesters:
            return "/lecture/semesters"
        case .postAllLecture:
            return "/lecture/semesters/AllLecture"
        case .postAllProfessor:
            return "/lecture/semesters/AllProfessor"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postSmesters:
            return .none
        case .postAllLecture(_, let requestBody):
            return .body(requestBody)
        case .postAllProfessor(_, let requestBody):
            return .body(requestBody)
        }
    }
    
    var headers : HTTPHeaders?{
        switch self{
        case .postSmesters(let token):
            return ["Authorization": "Bearer \(token)"]
        case .postAllLecture(let token, _):
            return ["Authorization": "Bearer \(token)"]
        case .postAllProfessor(let token, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
