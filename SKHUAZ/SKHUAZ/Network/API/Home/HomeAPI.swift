//
//  HomeAPI.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

import Alamofire

final class HomeAPI: BaseAPI {
    static let shared = HomeAPI()
    
    private override init() {}
}

extension HomeAPI {
    // 1. 전체 강의평 조회
    
    public func getUserInfo(token: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        AFManager.request(HomeRouter.getUserinfo(token: token)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: HomeDTO.self,
                                completion: completion)
        }
    }
}

