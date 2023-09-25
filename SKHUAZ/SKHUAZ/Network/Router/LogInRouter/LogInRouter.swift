//
//  LogInRouter.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

import Alamofire

enum LogInRouter {
    case LogIn (request: LogInRequest)
    case nicknameCheck (nickname: String )
}

struct LogInRequest: Encodable {
    let email: String
    let password: String
}

//struct nicknameRequest: Encodable {
//    let nickname: String
//}

extension LogInRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .LogIn:
            return .post
        case .nicknameCheck:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .LogIn:
            return "user/login"
        case .nicknameCheck(let nickname):
            return "/user/checkDuplicate/\(nickname)"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case let .LogIn(request):
            return .body(request)
        case let .nicknameCheck:
            return .none
        }
        
        var headers : HTTPHeaders?{
            switch self{
            case .LogIn:
                return nil
            case .nicknameCheck:
                return nil
            default:
                return nil
            }
        }
    }
}
