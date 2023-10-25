//
//  AdminPreLectureAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

import Alamofire

final class AdminPreLectureAPI: BaseAPI {
    static let shared = AdminPreLectureAPI()
    
    private override init() {}
}

extension AdminPreLectureAPI {
    
    // 1. Admin 화면 모든 선수과목 리스트 불러오기
    
    public func getAdminPreLecture(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(AdminPreLectureRouter.getAdminPreLecture(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AdminPreLectureDTO.self,
                                completion: completion)
        }
    }
    
    // 2. Admin 화면 선수과목 생성하기
    
    public func postAddAdminPreLecture(token: String,
                                       requestBody: AddAdminPreLectureRequestBody,
                                       completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(AdminPreLectureRouter.postAddAdminPreLecture(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AddAdminPreLectureDTO.self,
                                completion: completion)
        }
    }
}
