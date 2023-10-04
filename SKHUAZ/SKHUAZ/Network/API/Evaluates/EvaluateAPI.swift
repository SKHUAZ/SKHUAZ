//
//  EvaluateAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/22.
//

import Foundation

import Alamofire

final class EvaluateAPI: BaseAPI {
    static let shared = EvaluateAPI()
    
    private override init() {}
}

extension EvaluateAPI {
    // 1. 전체 강의평 조회
    
    public func getAllEvaluate(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.getAllEvaluation(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AllevaluateResponseDTO.self,
                                completion: completion)
        }
    }
    
    // 2. 강의평 상세보기
    
    public func getDetailEvaluation(token: String,
                                    evaluationId: Int,
                                    completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.getDetailEvaluation(token: token, evaluationId: evaluationId)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: DetailEvaluateDTO.self,
                                completion: completion)
        }
    }

    
    // 3. 강의평 저장하기
    
    public func postCreateEvaluate(token: String,
                                   requestBody: CreateEvaluateRequestBody,
                                   completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.postCreateEvaluation(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CreateEvaluateDTO.self,
                                completion: completion)
        }
    }
    
    // 4. 강의평 삭제하기
    
    public func delEvaluate(token: String,
                            evaluationId: Int,
                            completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.delEvaluation(token: token, evaluationId: evaluationId)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: DelEvaluateDTO.self,
                                completion: completion)
            
        }
    }
}

