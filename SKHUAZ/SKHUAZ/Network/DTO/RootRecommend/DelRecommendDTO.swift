//
//  DelRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/27/23.
//

import Foundation

struct DelRecommendDTO: Codable {
    let statusCode: Int
    let message: String
    let data: Bool?
}
