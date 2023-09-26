//
//  DetailEvaluateDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import Foundation

// MARK: - DetailEvaluateDTO
struct DetailEvaluateDTO: Codable {
    let statusCode: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let evaluationID, teamPlay, task, practice: Int
    let presentation: Int
    let title, review, createdAt, email: String
    let lecture: DetailLecture

    enum CodingKeys: String, CodingKey {
        case evaluationID = "evaluationId"
        case teamPlay, task, practice, presentation, title, review, createdAt, email, lecture
    }
}

// MARK: - Lecture
struct DetailLecture: Codable {
    let lectureID: Int
    let deptName, lecName, profName: String
    let semester: String

    enum CodingKeys: String, CodingKey {
        case lectureID = "lectureId"
        case deptName, lecName, profName, semester
    }
}
