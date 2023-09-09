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
}

let recommendReview1 = RecommendDataModel(titleLabel: "드디어 공개한다 소프1", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-19", contentLabel: "우하하 내용은 없지롱")

let recommendReview2 = RecommendDataModel(titleLabel: "드디어 공개한다 소프2", majorNameLabel: "소프트웨어공학과", creationDateLabel: "2023-08-20", contentLabel: "우하하 내용은 없지롱")

let recommendReview3 = RecommendDataModel(titleLabel: "드디어 공개한다 정통1", majorNameLabel: "정보통신공학과", creationDateLabel: "2023-08-21", contentLabel: "우하하 내용은 없지롱")

let recommendReview4 = RecommendDataModel(titleLabel: "드디어 공개한다 정통2", majorNameLabel: "정보통신공학과", creationDateLabel: "2023-08-22", contentLabel: "우하하 내용은 없지롱")

let recommendList: [RecommendDataModel] = [recommendReview1, recommendReview2, recommendReview3, recommendReview4]
