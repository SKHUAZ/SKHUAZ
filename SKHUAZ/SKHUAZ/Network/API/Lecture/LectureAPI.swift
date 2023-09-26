//
//  LectureAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import Foundation

import Alamofire

final class LectureAPI: BaseAPI {
    static let shared = LectureAPI()
    
    private override init() {}
}

extension LectureAPI {
    
    // 1. 학기 조회
    
    public func postSemesters(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LectureRouter.postSmesters(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SemestersDTO.self,
                                completion: completion)
            
        }
    }
    
    public func postAllLecture(token: String,
                               requestBody: AllLectureRequestBody,
                               completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LectureRouter.postAllLecture(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AllLectureDTO.self,
                                completion: completion)
        }
    }
    
    public func postAllProfessor(token: String,
                               requestBody: AllProfessorRequestBody,
                               completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(LectureRouter.postAllProfessor(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AllProfessorDTO.self,
                                completion: completion)
        }
    }

}
