//
//  MyRecommendsDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/29/23.
//

import Foundation

// MARK: - MyRecommendsDTO
struct MyRecommendsDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [MyRecommend]
}

// MARK: - Datum
struct MyRecommend: Codable {
    let routeID: Int
    let title, recommendation, createAt: String
    let email: String
    let preLectures: [MyRecommendPreLecture]

    enum CodingKeys: String, CodingKey {
        case routeID = "routeId"
        case title, recommendation, createAt, email, preLectures
    }
}

//enum Email: String, Codable {
//    case gjwldud0719NaverNet = "gjwldud0719@naver.net"
//}

// MARK: - PreLecture
struct MyRecommendPreLecture: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
