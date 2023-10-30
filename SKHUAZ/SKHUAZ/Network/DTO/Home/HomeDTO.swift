//
//  HomeDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/24/23.
//

import Foundation

// MARK: - HomeDTO
struct HomeDTO: Codable {
    let statusCode: Int
    let message: String
    let data: HomeData
}

// MARK: - DataClass
struct HomeData: Codable {
    let nickname, major1, major2, semester: String
    let graduate, department, majorMinor, doubleMajor: Bool

    enum CodingKeys: String, CodingKey {
        case nickname, major1, major2, semester, graduate, department
        case majorMinor = "major_minor"
        case doubleMajor = "double_major"
    }
}

