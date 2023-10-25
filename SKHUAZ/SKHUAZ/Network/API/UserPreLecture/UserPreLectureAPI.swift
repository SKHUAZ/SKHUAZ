//
//  UserPreLectureAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

import Alamofire

final class UserPreLectureAPI: BaseAPI {
    static let shared = UserPreLectureAPI()
    
    private override init() {}
}

extension UserPreLectureAPI {
    
    // 1. 학기별 선수과목 리스트 조회하기
    
    public func postUserSelectLec(token: String,
                                       requestBody: SelectLecRequestBody,
                                       completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserPreLectureRouter.postUserSelectLec(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SelectLecDTO.self,
                                completion: completion)
        }
    }
    
    // 2. 선택 가능 과목 판단
    
    public func getUserCheckLec(token: String,
                                    path: Int,
                                    completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserPreLectureRouter.getUserCheckLec(token: token, path: path)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CheckLecDTO.self,
                                completion: completion)
        }
    }
    
    // 3. 학기별 선택한 과목 전달
    
    public func postUserCheckYN(token: String,
                                requestBody: UserCheckYnRequestBody,
                                completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserPreLectureRouter.postUserCheckYN(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: UserCheckYnDTO.self,
                                completion: completion)
        }
    }
    
    public func postUserPreLecture(token: String,
                                   completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(UserPreLectureRouter.postUserPreLecture(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: UserPreLectureDTO.self,
                                completion: completion)
        }
    }

}
