//
//  signOutDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/26.
//

import Foundation

// MARK: - SignOutDTO
struct SignOutDTO: Codable {
    let statusCode: Int
    let data, message: String
}
