//
//  SignUpAPI.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

final class UserAPI: BaseAPI {
    static let shared = UserAPI()
    
    private override init() {}
}
    
extension UserAPI {
    
    public func SignUp(request: SignUpRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.SignUp(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SignUpResponseDTO.self,
                                completion: completion)
        }
    }
    
    public func emailAuth(request: emailSendRequest, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.emailAuth(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EmailAuthDTO.self,
                                completion: completion)
        }
    }
    
    public func emailAuthCode(request: emailCodeRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.emailCode(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EmailAuthCodeDTO.self,
                                completion: completion)
        }
    }
    public func LogIn(request: LogInRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.LogIn(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: LogInDTO.self,
                                completion: completion)
        }
    }
    
    public func LogOut(token: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.LogOut(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: LogOutDTO.self,
                                completion: completion)
        }
    }
    
    public func signOut(token: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.signOut(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SignOutDTO.self,
                                completion: completion)
        }
    }
    public func nicknameCheck(nickname: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.nicknameCheck(nickname: nickname)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: NicknameCheckDTO.self,
                                completion: completion)
        }
    }
    public func editProfile(request: EditProfileRequest, token: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserRouter.editProfile(request: request, token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EditProfileDTO.self,
                                completion: completion)
        }
    }
}
