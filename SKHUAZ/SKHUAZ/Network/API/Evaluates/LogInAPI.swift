//
//  LogInAPI.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

final class LogInAPI: BaseAPI {
    static let shared = LogInAPI()
    
    private override init() {}
}

extension LogInAPI {
    
    public func LogIn(request: LogInRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LogInRouter.LogIn(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: LogInDTO.self,
                                completion: completion)
        }
    }
    public func LogOut(token: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LogInRouter.LogOut(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: LogOutDTO.self,
                                completion: completion)
        }
    }
    public func nicknameCheck(nickname: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LogInRouter.nicknameCheck(nickname: nickname)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: NicknameCheckDTO.self,
                                completion: completion)
        }
    }
    public func editProfile(request: EditProfileRequest, token: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LogInRouter.editProfile(request: request, token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EditProfileDTO.self,
                                completion: completion)
        }
    }
}
