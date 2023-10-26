//
//  EvaluateDataModel.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import Foundation

import Foundation

struct EvaluateDataModel {
    var semester: String
    var professor: String
    var lecture: String
    var title: String
    var evaluate: String
    var firstPoint: Int
    var secondPoint: Int
    var thirdPoint: Int
    var fourthPoint: Int
    var department: String
    var authorName: String
    var evaluationId: Int // 서버에서 받는 evaluationId 필드를 추가
    var createdAt: String // 서버에서 받는 createdAt 필드를 추가
    var nickname: String

    // 이니셜라이저 추가
    init(semester: String, professor: String, lecture: String, title: String, evaluate: String, firstPoint: Int, secondPoint: Int, thirdPoint: Int, fourthPoint: Int, department: String, authorName: String, evaluationId: Int, createdAt: String, nickname: String) {
        self.semester = semester
        self.professor = professor
        self.lecture = lecture
        self.title = title
        self.evaluate = evaluate
        self.firstPoint = firstPoint
        self.secondPoint = secondPoint
        self.thirdPoint = thirdPoint
        self.fourthPoint = fourthPoint
        self.department = department
        self.authorName = authorName
        self.evaluationId = evaluationId
        self.createdAt = createdAt
        self.nickname = nickname
    }
}
