//
//  AdminPreLectureDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

// MARK: - AllPreLectureDTO
struct AdminPreLectureDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [adminPreLecture]
}

// MARK: - Datum
struct adminPreLecture: Codable {
    let subjectName, subjectSemester: String
}
