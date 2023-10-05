//
//  emailAuthDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

// MARK: - EmailAuthDTO
struct EmailAuthDTO: Codable {
    let statusCode: Int
    let data: String
    let message: String
}

// MARK: - EmailAuthCodeDTO
struct EmailAuthCodeDTO: Codable {
    let statusCode: Int
    let message : String
    let data: Bool?
}

