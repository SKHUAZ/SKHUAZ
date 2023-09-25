//
//  SignUpAPI.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

final class SignUpAPI: BaseAPI {
    static let shared = SignUpAPI()
    
    private override init() {}
}

extension SignUpAPI {
    
    public func SignUp(request: SignUpRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(SignUpRouter.SignUp(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SignUpResponseDTO.self,
                                completion: completion)
        }
    }
        public func emailAuth(email: String,  completion: @escaping(NetworkResult<Any>) -> Void) {
            AFManager.request(SignUpRouter.emailAuth(email: email)).responseData { response in
                self.disposeNetwork(response,
                                    dataModel: EmailAuthDTO.self,
                                    completion: completion)
            }
        }
    public func emailAuthCode(request: emailCodeRequest,  completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(SignUpRouter.emailCode(request: request)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EmailAuthCodeDTO.self,
                                completion: completion)
        }
    }
    }
