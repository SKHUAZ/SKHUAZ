//
//  CreateRecommendRequestBody.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/27/23.
//

import Foundation

struct CreateRecommendRequestBody: Codable {
    var title, recommendation: String
    var preLectureList: [Int]
    
    init(title: String = "", recommendation: String = "", preLectureList: [Int] = [Int]()) {
        self.title = title
        self.recommendation = recommendation
        self.preLectureList = preLectureList
    }
}

