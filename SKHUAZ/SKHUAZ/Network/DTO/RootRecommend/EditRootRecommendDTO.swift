//
//  EditRootRecommendDTO.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/30/23.
//

import Foundation

// MARK: - EditRootRecommendDTO
struct EditRootRecommendDTO: Codable {
    let statusCode: Int
    let message: String
    let data: EditDataClass
}

// MARK: - DataClass
struct EditDataClass: Codable {
    let title, recommendation, createAt, email: String
    let preLectures: [EditPreLecture]
    let routeID: Int

    enum CodingKeys: String, CodingKey {
        case title, recommendation, createAt, email, preLectures
        case routeID = "routeId"
    }
}

// MARK: - PreLecture
struct EditPreLecture: Codable {
    let preLectureID: Int
    let semester: String
    let lecNames: [String]
    let email: String

    enum CodingKeys: String, CodingKey {
        case preLectureID = "preLectureId"
        case semester, lecNames, email
    }
}
