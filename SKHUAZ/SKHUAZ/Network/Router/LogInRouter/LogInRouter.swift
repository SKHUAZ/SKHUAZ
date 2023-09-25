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
        }
    }
    
    var path: String {
        switch self {
        case .LogIn:
            return "user/login"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case let .LogIn(request):
            return .body(request)
        }
        
        var headers : HTTPHeaders?{
            switch self{
            case .LogIn:
                return nil
            default:
                return nil
            }
        }
    }
}
