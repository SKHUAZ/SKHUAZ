//
//  SignUpResponseDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/24.
//

import Foundation

// MARK: - SignUpResponseDTO
struct SignUpResponseDTO: Codable {
    let statusCode: Int
    let data: SignUpData
    let message: String
}

// MARK: - DataClass
struct SignUpData: Codable {
    let email, nickname: String
    let semester: Int
    let graduate: Bool
    let major1, major2: String
    let department, majorMinor, doubleMajor: Bool
    
    enum CodingKeys: String, CodingKey {
        case email, nickname, semester, graduate, major1, major2, department
        case majorMinor = "major_minor"
        case doubleMajor = "double_major"
    }
}
