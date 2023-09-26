//
//  CreateRootRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/26.
//

import Foundation

// MARK: - Welcome
struct CreateRootRecommendDTO: Codable {
    let title, recommendation: String
    let preLectureList: [Int]
}
