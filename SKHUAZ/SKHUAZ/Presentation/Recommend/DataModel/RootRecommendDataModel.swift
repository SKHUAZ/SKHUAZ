//
//  RootRecommendDataModel.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/25.
//
import Foundation

struct RootRecommendDataModel {
    var title: String
    var recommendation: String
    var createAt: String
    var email: String
    var preLectures: [PreLectures]

    // 이니셜라이저 추가
    init(title: String, recommendation: String, createAt: String, email: String, preLectures: [PreLectures]) {
        self.title = title
        self.recommendation = recommendation
        self.createAt = createAt
        self.email = email
        self.preLectures = preLectures
    }
}

struct PreLectures {
    var preLectureId: Int
    var semester: String
    var lecNames: [String]

    init(preLectureId: Int, semester: String, lecNames: [String]) {
            self.preLectureId = preLectureId
            self.semester = semester
            self.lecNames = lecNames
        }
}
