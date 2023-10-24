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
    // 1. 전체 강의평 조회
    
    public func getAdminPreLecture(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(AdminPreLectureRouter.getAdminPreLecture(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AdminPreLectureDTO.self,
                                completion: completion)
        }
    }
}
