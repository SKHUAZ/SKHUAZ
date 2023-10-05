//
//  EditProfileDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/26.
//

import Foundation

// MARK: - EditProfileDTO
struct EditProfileDTO: Codable {
    let statusCode: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let nickname, semester: String
    let graduate: Bool
    let major1, major2: String
    let department, majorMinor, doubleMajor: Bool

    enum CodingKeys: String, CodingKey {
        case nickname, semester, graduate, major1, major2, department
        case majorMinor = "major_minor"
        case doubleMajor = "double_major"
    }
}
