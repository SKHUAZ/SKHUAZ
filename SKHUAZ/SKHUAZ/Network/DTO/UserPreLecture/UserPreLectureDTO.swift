//
//  UserPreLectureDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/26/23.
//

import Foundation

// MARK: - PreLectureDTO
struct UserPreLectureDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [preLectureData]
}

// MARK: - Datum
struct userPreLectureData: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
