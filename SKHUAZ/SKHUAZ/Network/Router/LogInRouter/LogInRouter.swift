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
    case LogOut(token: String)
}

struct LogInRequest: Encodable {
    let email: String
    let password: String
}

extension LogInRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .LogIn:
            return .post
        case .nicknameCheck:
            return .get
        case .LogOut:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .LogIn:
            return "user/login"
        case .nicknameCheck(let nickname):
            return "/user/checkDuplicate/\(nickname)"
        case .LogOut:
            return "/user/logout"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case let .LogIn(request):
            return .body(request)
        case let .nicknameCheck:
            return .none
        case .LogOut:
            return .none
        }
    }
    var headers : HTTPHeaders?{
        switch self{
        case .LogIn:
            return nil
        case .nicknameCheck:
            return nil
        case .LogOut(let token):
            return ["Authorization": "Bearer \(token)"]
        default:
            return nil
        }
    }
}
