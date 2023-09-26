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
    // 1. 전체 루틴 조회
    
    public func getAllEvaluate(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.getAllEvaluation(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AllevaluateResponseDTO.self,
                                completion: completion)
        }
    }
    
//    public func getDetailEvaluation(token: String, evaluationId: Int, completion: @escaping(NetworkResult<Any>) -> Void) {
//        AFManager.request(EvaluateRouter.getDetailEvaluation(token: token, evaluationId: evaluationId)).responseData { response in
//            self.disposeNetwork(response,
//                                dataModel: DetailEvaluateDTO.self,
//                                completion: completion)
//        }
//    }
    
    
    
    
    
    public func getDetailEvaluation(token: String,
                                    evaluationId: Int,
                                    completion: @escaping (Result<DetailEvaluateDTO?, Error>) -> Void) {

            AF.request(EvaluateRouter.getDetailEvaluation(token: token,
                                                          evaluationId: evaluationId))
                .validate()
                .responseDecodable(of: DetailEvaluateDTO.self) { response in

                    switch response.result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            completion(.success(data))
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
    }
    
    
    
    
    
    public func postCreateEvaluate(token: String,
                                   requestBody: CreateEvaluateRequestBody,
                                   completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(EvaluateRouter.postCreateEvaluation(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CreateEvaluateDTO.self,
                                completion: completion)
        }
    }
}

