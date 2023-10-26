//
//  AllevaluateResponseDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/22.
//

import Foundation

// MARK: - Template
struct AllevaluateResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [AllevaluateData]
}

// MARK: - Datum
struct AllevaluateData: Codable {
    let evaluationID, teamPlay, task, practice: Int
    let presentation: Int
    let title, review, createdAt, nickname: String
    let lecture: Lecture

    enum CodingKeys: String, CodingKey {
        case evaluationID = "evaluationId"
        case teamPlay, task, practice, presentation, title, review, createdAt, nickname, lecture
    }
}

// MARK: - Lecture
struct Lecture: Codable {
    let lectureID: Int
    let deptName, lecName, profName, semester: String

    enum CodingKeys: String, CodingKey {
        case lectureID = "lectureId"
        case deptName, lecName, profName, semester
    }
}
