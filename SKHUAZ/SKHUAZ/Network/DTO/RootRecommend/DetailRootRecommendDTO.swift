//
//  DetailRootRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/25/23.
//

//
//  DetailRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/25/23.
//

import Foundation

// MARK: - DetailRecommendDTO
struct DetailRecommendDTO: Codable {
    let statusCode: Int
    let message: String
    let data: DetailDataClass
}

// MARK: - DataClass
struct DetailDataClass: Codable {
    let title, recommendation: String
    let preLectures: [DetailPreLecture]
}

// MARK: - PreLecture
struct DetailPreLecture: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
