//
//  logInDTO.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/25.
//

import Foundation

// MARK: - LogInDTO

struct LogInDTO: Codable {
    let grantType, accessToken, accessTokenExpireTime, refreshToken: String
    let refreshTokenExpireTime: String
}
