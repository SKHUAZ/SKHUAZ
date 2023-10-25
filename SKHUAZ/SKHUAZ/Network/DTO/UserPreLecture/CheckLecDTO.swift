//
//  CheckLecDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

// MARK: - CheckLecDTO
struct CheckLecDTO: Codable {
    let statusCode: Int
    let message, data: String
}

struct CheckErrorDTO: Codable {
    let statusCode: Int
    let message: String?
    let data: String?
}

