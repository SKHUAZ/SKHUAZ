//
//  MyEvaluationsDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/27/23.
//

import Foundation

// MARK: - MyEvaluationsDTO
struct MyEvaluationsDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [MyEvaluate]
}

// MARK: - Datum
struct MyEvaluate: Codable {
    let evaluationID, teamPlay, task, practice: Int
    let presentation: Int
    let title, review, createdAt, nickname: String
    let lecture: Lecture

    enum CodingKeys: String, CodingKey {
        case evaluationID = "evaluationId"
        case teamPlay, task, practice, presentation, title, review, createdAt, nickname, lecture
    }
}
