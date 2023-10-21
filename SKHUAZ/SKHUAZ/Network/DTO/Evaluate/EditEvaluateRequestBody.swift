//
//  EditEvaluateRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/21/23.
//

import Foundation

// MARK: - EditEvaluateRequestBody
struct EditEvaluateRequestBody: Codable {
    let deptName, lecName, profName, semester: String
    let teamPlay, task, practice, presentation: Int
    let title, review: String
}
