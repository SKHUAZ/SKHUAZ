//
//  RootRecommendAPI.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/25.
//
import Foundation
import Alamofire

final class RootRecommendAPI: BaseAPI {
    static let shared = RootRecommendAPI()

    private override init() {}
}

extension RootRecommendAPI {

    // MARK: - 전체 루트추천 조회
    
    public func getAllRootRecommend(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(RootRecommendRouter.getAllRootRecommend(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: AllRootRecommendResponseDTO.self,
                                completion: completion)
        }
    }
    
    // MARK: - 루트추천 상세보기
    
    public func getDetailRootRecommend(token: String,
                                       rootrecommendID: Int,
                                    completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(RootRecommendRouter.getDetailRootRecommend(token: token, rootrecommendID: rootrecommendID)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: DetailRecommendDTO.self,
                                completion: completion)
        }
    }
    
    // MARK: - 루트추천 저장하기
    
    public func postCreateRootRecommend(token: String,
                                   requestBody: CreateRecommendRequestBody,
                                   completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(RootRecommendRouter.postCreateRootRecommend(token: token, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CreateRootRecommendDTO.self,
                                completion: completion)
        }
    }
    
    // MARK: - 루트추천 삭제하기
    
    public func delRootRecommend(token: String,
                            recommendId: Int,
                            completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(RootRecommendRouter.delRootRecommend(token: token, recommendId: recommendId)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: DelRecommendDTO.self,
                                completion: completion)
            
        }
    }
    
    // MARK: - 루트추천 수정하기
    
    public func editRootRecommend(token: String,
                                  recommendId: Int,
                             requestBody: CreateRecommendRequestBody,
                             completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(RootRecommendRouter.editRootRecommend(token: token, evaluationId: recommendId, requestBody: requestBody)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: EditEvaluateDTO.self,
                                completion: completion)
        }
    }

}
