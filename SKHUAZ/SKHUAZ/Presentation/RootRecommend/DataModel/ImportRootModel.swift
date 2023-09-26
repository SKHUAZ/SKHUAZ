//
//  ImportRootModel.swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/13.
//

import Foundation

struct ImportRootModel {
    var courseYear: String
    var lectureName: String
    var professorName: String
}

let ImportRootReview1 = ImportRootModel(courseYear: "1학년 2학기", lectureName: "파이썬", professorName: "홍은지")
let ImportRootReview2 = ImportRootModel(courseYear: "2학년 1학기", lectureName: "자바프로그래밍", professorName: "문성현")
let ImportRootReview3 = ImportRootModel(courseYear: "2학년 2학기", lectureName: "자료구조", professorName: "김명철")
let ImportRootReview4 = ImportRootModel(courseYear: "3학년 1학기", lectureName: "알고리즘", professorName: "노은하")

let importRootReviewList = [ImportRootReview1, ImportRootReview2, ImportRootReview3, ImportRootReview4]
