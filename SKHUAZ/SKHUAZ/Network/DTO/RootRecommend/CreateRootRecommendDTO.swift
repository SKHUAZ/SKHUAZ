//
//  CreateRootRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/26.
//
import Foundation


// MARK: - Welcome
struct CreateRootRecommendDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [CreateData]
}

// MARK: - Datum
struct CreateData: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
