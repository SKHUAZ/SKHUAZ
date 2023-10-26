//
//  RecommendDataModel.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/08/20.
//

import Foundation


struct RecommendDataModel {
    var titleLabel: String
    var majorNameLabel: String
    var creationDateLabel: String
    var contentLabel: String
    var nickNameLabel: String
    var courseYearLabel: String
    var lectureNameLabel: [[String]]
    var professorNameLabel: String
    var authorNameLabel: String
}

let recommendReview1 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데통"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview2 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview3 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview4 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview5 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview6 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendReview7 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "서버통신을 통하여 받아올 데이터 파트입니다.", nickNameLabel: "박신영", courseYearLabel: "1학년 1학기", lectureNameLabel: [["자바프로그래밍", "파이썬"], ["컴퓨터구조", "데이터 통신"]], professorNameLabel: "홍은지", authorNameLabel: "박신영")

let recommendList: [RecommendDataModel] = [recommendReview1, recommendReview2, recommendReview3, recommendReview4, recommendReview5, recommendReview6, recommendReview7]
