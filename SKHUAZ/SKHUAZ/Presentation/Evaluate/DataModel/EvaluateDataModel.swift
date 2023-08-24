//
//  EvaluateDataModel.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import Foundation

struct EvaluateDataModel {
    var department: String
    var lectureNameLabel: String
    var professorNameLabel: String
    var courseYearLabel: String
    var totalScoreLabel: Int
    var authorNameLabel: String
    var dateCreatedLabel: String
}

let review1 = EvaluateDataModel(department: "소프트웨어공학", lectureNameLabel: "자바 프로그래밍", professorNameLabel: "문성현",
                                courseYearLabel: "2023-1", totalScoreLabel: 4, authorNameLabel: "김철수",
                                dateCreatedLabel: "2023-08-17")
let review2 = EvaluateDataModel(department: "소프트웨어공학", lectureNameLabel: "데이터베이스", professorNameLabel: "홍은지",
                                courseYearLabel: "2023-1", totalScoreLabel: 5, authorNameLabel: "박지민",
                                dateCreatedLabel: "2023-08-18")
let review3 = EvaluateDataModel(department: "소프트웨어공학", lectureNameLabel: "알고리즘", professorNameLabel: "노은하",
                                courseYearLabel: "2022-2", totalScoreLabel: 3, authorNameLabel: "이영호",
                                dateCreatedLabel: "2023-08-19")
let review4 = EvaluateDataModel(department: "소프트웨어공학", lectureNameLabel: "자료구조", professorNameLabel: "노은하",
                                courseYearLabel: "2023-1", totalScoreLabel: 4, authorNameLabel: "홍길동",
                                dateCreatedLabel: "2023-08-20")
let review5 = EvaluateDataModel(department: "소프트웨어공학", lectureNameLabel: "모바일프로그래밍", professorNameLabel: "이승진",
                                courseYearLabel: "2022-1", totalScoreLabel: 5, authorNameLabel: "정재민",
                                dateCreatedLabel: "2023-08-21")
let review6 = EvaluateDataModel(department: "정보통신공학", lectureNameLabel: "리눅스 시스템", professorNameLabel: "박정식",
                                courseYearLabel: "2023-1", totalScoreLabel: 3, authorNameLabel: "천성우",
                                dateCreatedLabel: "2023-07-23")

var reviewList: [EvaluateDataModel] = [review1, review2, review3, review4, review5, review6]
