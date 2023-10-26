//
//  EditEvaluateDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/21/23.
//

import Foundation

// MARK: - EditEvaluateDTO
struct EditEvaluateDTO: Codable {
    let statusCode: Int
    let data: editEvaluateData
    let message: String
}

// MARK: - DataClass
struct editEvaluateData: Codable {
    let deptName, lecName, profName: String
    let semester, teamPlay, task, practice: Int
    let presentation: Int
    let title, review: String
}
