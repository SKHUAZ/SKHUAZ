//
//  CreateEvaluateDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//


import Foundation

// MARK: - CreateEvaluateDTO
struct CreateEvaluateDTO: Codable {
    let statusCode: Int
    let data: CreateEvaluateData
    let message: String
}

// MARK: - DataClass
struct CreateEvaluateData: Codable {
    let deptName, lecName, profName: String
    let semester, teamPlay, task, practice: Int
    let presentation: Int
    let title, review: String
}
