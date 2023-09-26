//
//  AllRootRecommendResponseDTO..swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/25.
//

import Foundation

// MARK: - RootRecommendResponseDTO

struct AllRootRecommendResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [AllRootRecommendData]
}

// MARK: - RootRecommendData

struct AllRootRecommendData: Codable {
    let title, recommendation, createAt, email: String
    let preLectures: [PreLecture]

}

// MARK: - PreLecture

struct PreLecture: Codable {
    let preLectureId: Int
    let semester : String
    let lecNames : [String]

   enum CodingKeys : String , CodingKey{
        case preLectureId = "preLectureId"
        case semester = "semester"
        case lecNames = "lecNames"
   }
}
