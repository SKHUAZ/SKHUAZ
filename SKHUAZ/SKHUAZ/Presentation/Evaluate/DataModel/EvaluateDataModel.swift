//
//  EvaluateDataModel.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

import Foundation

struct EvaluateDataModel {
    var title: String
    var department: String
    var lectureNameLabel: String
    var professorNameLabel: String
    var courseYearLabel: String
    var totalScoreLabel: Int
    var authorNameLabel: String
    var dateCreatedLabel: String
    var evaluate: String
    var evaluatePoint1: Int
    var evaluatePoint2: Int
    var evaluatePoint3: Int
    var evaluatePoint4: Int
}

let review1 = EvaluateDataModel(title: "리뷰 1", department: "소프트웨어공학", lectureNameLabel: "자바 프로그래밍",
                                professorNameLabel: "문성현", courseYearLabel: "2023-1", totalScoreLabel: 4,
                                authorNameLabel: "김철수", dateCreatedLabel: "2023-08-17", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 4, evaluatePoint2: 3, evaluatePoint3: 1,
                                evaluatePoint4: 5)
let review2 = EvaluateDataModel(title: "리뷰 2", department: "소프트웨어공학", lectureNameLabel: "데이터베이스",
                                professorNameLabel: "홍은지", courseYearLabel: "2023-1", totalScoreLabel: 5,
                                authorNameLabel: "박지민", dateCreatedLabel: "2023-08-18", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 1, evaluatePoint2: 4, evaluatePoint3: 5,
                                evaluatePoint4: 2)
let review3 = EvaluateDataModel(title: "리뷰 3", department: "소프트웨어공학", lectureNameLabel: "알고리즘",
                                professorNameLabel: "노은하", courseYearLabel: "2022-2", totalScoreLabel: 3,
                                authorNameLabel: "이영호", dateCreatedLabel: "2023-08-19", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 5, evaluatePoint2: 2, evaluatePoint3: 3,
                                evaluatePoint4: 1)
let review4 = EvaluateDataModel(title: "리뷰 4", department: "소프트웨어공학", lectureNameLabel: "자료구조",
                                professorNameLabel: "노은하", courseYearLabel: "2023-1", totalScoreLabel: 4,
                                authorNameLabel: "홍길동", dateCreatedLabel: "2023-08-20", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 4, evaluatePoint2: 3, evaluatePoint3: 1,
                                evaluatePoint4: 5)
let review5 = EvaluateDataModel(title: "리뷰 5", department: "소프트웨어공학", lectureNameLabel: "모바일프로그래밍",
                                professorNameLabel: "이승진", courseYearLabel: "2022-1", totalScoreLabel: 5,
                                authorNameLabel: "정재민", dateCreatedLabel: "2023-08-21", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 2, evaluatePoint2: 4, evaluatePoint3: 2,
                                evaluatePoint4: 3)
let review6 = EvaluateDataModel(title: "리뷰 6", department: "정보통신공학", lectureNameLabel: "리눅스 시스템",
                                professorNameLabel: "박정식", courseYearLabel: "2023-1", totalScoreLabel: 3,
                                authorNameLabel: "천성우", dateCreatedLabel: "2023-07-23", evaluate: "콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.콘텐츠 내용 노출. 길면 말줄임표 처리가 필요합니다.",
                                evaluatePoint1: 1, evaluatePoint2: 5, evaluatePoint3: 4,
                                evaluatePoint4: 5)

var reviewList: [EvaluateDataModel] = [review1, review2, review3, review4, review5, review6]
