//
//  AllLectureDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/26.
//

import Foundation

// MARK: - AllLectureDTO
struct AllLectureDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [String]
}
