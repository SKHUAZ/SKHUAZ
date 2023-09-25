//
//  SignUpRouter.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

import Alamofire

enum SignUpRouter {
    case SignUp (request: SignUpRequest)
    case emailAuth (request: emailSendRequest)
    case emailCode (request: emailCodeRequest)
}

struct emailSendRequest: Encodable {
    let email: String
}

struct emailCodeRequest: Encodable {
    let email: String
    let code: String
}

struct SignUpRequest: Encodable {
    let email: String
    let password: String
    let nickname: String
    let semester: String
    let graduate: Bool
    let major1: String
    let major2: String
    let department: Bool
    let major_minor: Bool
    let double_major: Bool
}

extension SignUpRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .SignUp:
            return .post
        case .emailAuth:
            return .post
        case .emailCode:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .SignUp:
            return "user/join"
        case .emailAuth:
            return "email/send"
        case .emailCode:
            return "email/verify/code"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case let .SignUp(request):
            return .body(request)
        case let .emailAuth(request):
            return .body(request)
        case let .emailCode(request):
            return .body(request)
        }
        
        var headers : HTTPHeaders?{
            switch self{
            case .SignUp:
                return nil
            case .emailAuth:
                return nil
            case .emailCode:
                return nil
            default:
                return nil
            }
        }
    }
}
