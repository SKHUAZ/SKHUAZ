//
//  SignUpRouter.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

import Alamofire

enum UserRouter {
    case LogIn (request: LogInRequest)
    case nicknameCheck (nickname: String )
    case LogOut(token: String)
    case editProfile(request: EditProfileRequest, token: String)
    case signOut(token: String)
    case SignUp (request: SignUpRequest)
    case emailAuth (request: emailSendRequest)
    case emailCode (request: emailCodeRequest)
}

struct LogInRequest: Encodable {
    let email: String
    let password: String
}

struct EditProfileRequest: Encodable {
    let nickname: String
    let semester: String
    let graduate: Bool
    let major1, major2: String
    let department, majorMinor, doubleMajor: Bool

    enum CodingKeys: String, CodingKey {
        case nickname, semester, graduate, major1, major2, department
        case majorMinor = "major_minor"
        case doubleMajor = "double_major"
    }
}

struct emailSendRequest: Encodable {
    let email: String
}

struct emailCodeRequest: Encodable {
    let email: String
    let code: String
}

struct SignUpRequest: Encodable {
    let email, password, nickname: String
    let semester: String
    let graduate: Bool
    let major1, major2: String
    let department, majorMinor, doubleMajor: Bool
    
    enum CodingKeys: String, CodingKey {
        case email, password, nickname, semester, graduate, major1, major2, department
        case majorMinor = "major_minor"
        case doubleMajor = "double_major"
    }
}

extension UserRouter: BaseTargetType {
    
    var baseURL: String { return Config.baseURL }
    
    var method: HTTPMethod {
        switch self {
        case .LogIn:
            return .post
        case .nicknameCheck:
            return .get
        case .LogOut:
            return .post
        case .signOut:
            return .delete
        case .editProfile:
            return .post
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
        case .LogIn:
            return "user/login"
        case .nicknameCheck(let nickname):
            return "/user/checkDuplicate/\(nickname)"
        case .LogOut:
            return "/user/logout"
        case .signOut:
            return "/user/delete"
        case .editProfile:
            return "/user/update-information"
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
        case let .LogIn(request):
            return .body(request)
        case let .nicknameCheck:
            return .none
        case .LogOut:
            return .none
        case .signOut:
            return .none
        case let .editProfile(request, _):
            return .body(request)
        case let .SignUp(request):
            return .body(request)
        case let .emailAuth(request):
            return .body(request)
        case let .emailCode(request):
            return .body(request)
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
            case .signOut(let token):
                return ["Authorization": "Bearer \(token)"]
            case .editProfile(_, let token):
                return ["Authorization": "Bearer \(token)"]
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
