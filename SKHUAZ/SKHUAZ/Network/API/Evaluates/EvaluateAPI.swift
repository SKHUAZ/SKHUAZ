//
//  EvaluateAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/22.
//

import Foundation

import Alamofire

//class EvaluationAPIManager {
//
//    let api = BaseAPI()
//
//    func getAllEvaluations(token:String, completion:@escaping (NetworkResult<AllevaluateResponseDTO>) -> Void) {
//        let router = EvaluateRouter.getAllEvaluation(token: token)
//        api.AFManager.request(router).responseData { response in
//            self.api.disposeNetwork(response,
//                               dataModel: AllevaluateResponseDTO.self) { result in
//                if let result = result as? NetworkResult<AllevaluateResponseDTO> {
//                    completion(result)
//                } else {
//                    // 캐스팅 실패 처리
//                    completion(.pathErr)
//                }
//            }
//        }
//    }
//}

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
}

