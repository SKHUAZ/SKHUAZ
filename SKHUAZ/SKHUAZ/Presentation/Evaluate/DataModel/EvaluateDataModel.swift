//
//  EvaluateDataModel.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/17.
//

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
}

let dataModels: [EvaluateDataModel] = [
    EvaluateDataModel(semester: "2023-2", professor: "이승진", lecture: "프론트엔드개발",
                      title: "프엔별로 안 어려움",
                      evaluate: "프론트엔드개발 교수님이 처음에 겁 주시는 거 치곤 그렇게 어렵지 않았음. 약간 그 때 겁 줘가지고 빠지는 사람 많은데 존버한 다음 수업자료 보고 열심히만 하면 될 듯",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학과", authorName: "천성우"),
    EvaluateDataModel(semester: "2023-1", professor: "이승진", lecture: "모바일프로그래밍",
                      title: "코틀린 안 해서 아쉽다",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학과", authorName: "박신영"),
    EvaluateDataModel(semester: "2023-1", professor: "노은하", lecture: "자료구조",
                      title: "자료구조 엄..",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학", authorName: "허지영"),
    EvaluateDataModel(semester: "2023-1", professor: "노은하", lecture: "알고리즘",
                      title: "자바로 해서 조금 아쉽다",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학", authorName: "문인호"),
    EvaluateDataModel(semester: "2023-1", professor: "문성현", lecture: "고급자바프로그래밍",
                      title: "퇴근하고싶다",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학", authorName: "윤다혜"),
    EvaluateDataModel(semester: "2022-1", professor: "정인철", lecture: "컴퓨터 구조",
                      title: "컴구 어렵다",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "정보통신공학", authorName: "한종수"),
    EvaluateDataModel(semester: "2022-1", professor: "정인철", lecture: "컴퓨터 구조",
                      title: "진짜 인철좌..",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "정보통신공학", authorName: "천성우"),
    EvaluateDataModel(semester: "2022-1", professor: "이하규", lecture: "C++프로그래밍",
                      title: "C+씨뿔..",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "정보통신공학", authorName: "박신영"),
    EvaluateDataModel(semester: "2023-1", professor: "문성현", lecture: "회사원",
                      title: "퇴근하고싶다 허지영.ver",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "소프트웨어공학", authorName: "허지영"),
    EvaluateDataModel(semester: "2023-1", professor: "정인철", lecture: "디지털회로실험",
                      title: "디회실 너무 어렵더라",
                      evaluate: "서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다 서버 통신으로 받아올 데이터 입니다",
                      firstPoint: Int.random(in: 1...10), secondPoint: Int.random(in: 1...10),
                      thirdPoint: Int.random(in: 1...10), fourthPoint: Int.random(in: 1...10),
                      department: "정보통신공학", authorName: "문인호")
]


var reviewList: [EvaluateDataModel] = dataModels
