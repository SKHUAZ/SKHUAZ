//
//  nicknameCheckDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

// MARK: - NicknameCheckDTO
struct NicknameCheckDTO: Codable {
    let statusCode: Int
    let message, data: String
}

struct ErrorDTO: Codable {
    let httpStatus: String
    let statusCode: Int
    let errorMessage: String
    
}
