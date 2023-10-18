//
//  logOutDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/26.
//

import Foundation

// MARK: - LogOutDTO
struct LogOutDTO: Codable {
    let statusCode: Int
    let data: Bool?
    let message: String
}
