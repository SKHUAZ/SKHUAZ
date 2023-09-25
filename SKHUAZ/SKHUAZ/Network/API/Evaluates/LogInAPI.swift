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
}
