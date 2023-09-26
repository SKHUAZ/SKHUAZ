//
//  preLectureDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/26.
//

import Foundation

// MARK: - PreLectureDTO
struct PreLectureDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [preLectureData]
}

// MARK: - Datum
struct preLectureData: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
