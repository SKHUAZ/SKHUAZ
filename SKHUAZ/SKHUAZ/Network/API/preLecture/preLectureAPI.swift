//
//  preLectureAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/26.
//

import Foundation

import Alamofire

final class preLectureAPI: BaseAPI {
    static let shared = preLectureAPI()
    
    private override init() {}
}

extension preLectureAPI {
    
    public func postPreLecture(token: String,
                               requestBody: [PreLectureRequestBody],
                               completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(preLectureRouter.postPreLecture(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: PreLectureDTO.self,
                                completion: completion)
        }
    }
    
    public func getPreLecture(token: String,
                               completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(preLectureRouter.getPreLecture(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: PreLectureDTO.self,
                                completion: completion)
        }
    }
}

