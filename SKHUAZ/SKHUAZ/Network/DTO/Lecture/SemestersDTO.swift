//
//  SemestersDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import Foundation

// MARK: - SemestersDTO
struct SemestersDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [String]
}
