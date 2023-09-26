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
    case editProfile(request: EditProfileRequest, token: String)
    case signOut(token: String)
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
        case .signOut:
            return .delete
        case .editProfile:
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
        default:
            return nil
        }
    }
}
