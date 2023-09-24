//
//  EssentialDataModel.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/14.
//

import Foundation

struct EssentialDataModel: Equatable {
    var lectureName: String
    var professorName: String
}


var essentialDataModels: [[EssentialDataModel]] = [
    [
        EssentialDataModel(lectureName: "웹개발입문", professorName: "1학년 2학기"),
        EssentialDataModel(lectureName: "Python프로그래밍", professorName: "1학년 2학기"),
    ],
    [
        EssentialDataModel(lectureName: "Java프로그래밍", professorName: "2학년 1학기"),
        EssentialDataModel(lectureName: "데이터베이스", professorName: "2학년 1학기"),
        EssentialDataModel(lectureName: "사물인터넷 기초", professorName: "2학년 1학기"),
    ],
    [
        EssentialDataModel(lectureName: "운영체제", professorName: "2학년 2학기"),
        EssentialDataModel(lectureName: "컴퓨터구조", professorName: "2학년 2학기"),
        EssentialDataModel(lectureName: "자료구조", professorName: "2학년 2학기"),
        EssentialDataModel(lectureName: "데이터통신", professorName: "2학년 2학기"),
        EssentialDataModel(lectureName: "웹프로그래밍", professorName: "2학년 2학기"),
        EssentialDataModel(lectureName: "데이터분석입문", professorName: "2학년 2학기"),
    ],
    [
        EssentialDataModel(lectureName: "알고리즘", professorName: "3학년 1학기"), //
        EssentialDataModel(lectureName: "컴퓨터네트워크", professorName: "3학년 1학기"), //
        EssentialDataModel(lectureName: "프론트엔드개발", professorName: "3학년 1학기"),
        EssentialDataModel(lectureName: "모바일프로그래밍", professorName: "3학년 1학기"), //
        EssentialDataModel(lectureName: "고급Java프로그래밍", professorName: "3학년 1학기"),
        EssentialDataModel(lectureName: "Python프로젝트", professorName: "3학년 1학기"),
    ],
    [
        EssentialDataModel(lectureName: "서버구축및형상관리", professorName: "3학년 2학기"), //
        EssentialDataModel(lectureName: "네트워크프로그래밍", professorName: "3학년 2학기"), //
        EssentialDataModel(lectureName: "백엔드프레임워크", professorName: "3학년 2학기"), //
        EssentialDataModel(lectureName: "프론트엔드프레임워크", professorName: "3학년 2학기"),
        EssentialDataModel(lectureName: "Java프로젝트", professorName: "3학년 2학기"),
        EssentialDataModel(lectureName: "시스템분석및설계", professorName: "3학년 2학기"),
        EssentialDataModel(lectureName: "통계자료분석및실습", professorName: "3학년 2학기"),
        EssentialDataModel(lectureName: "사물인터넷", professorName: "3학년 2학기"),
    ],
    [
        EssentialDataModel(lectureName: "졸업지도", professorName: "4학년 1학기"), //
        EssentialDataModel(lectureName: "보안시스템", professorName: "4학년 1학기"),
        EssentialDataModel(lectureName: "소프트웨어캡스톤디자인", professorName: "4학년 1학기"), //
        EssentialDataModel(lectureName: "하이브리드앱프로그래밍", professorName: "4학년 1학기"),
        EssentialDataModel(lectureName: "인공지능", professorName: "4학년 1학기"),
        EssentialDataModel(lectureName: "빅데이터", professorName: "4학년 1학기"),
        EssentialDataModel(lectureName: "사물인터넷캡스톤디자인", professorName: "4학년 1학기"),
    ],
    [
        EssentialDataModel(lectureName: "머신러닝", professorName: "4학년 2학기"),
        EssentialDataModel(lectureName: "빅데이터실무", professorName: "4학년 2학기"),

    ]
                                                   
]


struct saveEssentialDataModel: Equatable {
    var lectureName: String
    var professorName: String
}

var saveEssentialDataModels: [saveEssentialDataModel] =
[
    saveEssentialDataModel(lectureName: "웹개발입문", professorName: "1학년 2학기"),
    
    saveEssentialDataModel(lectureName: "Java프로그래밍", professorName: "2학년 1학기"),
    saveEssentialDataModel(lectureName: "데이터베이스", professorName: "2학년 1학기"),
    
    saveEssentialDataModel(lectureName: "운영체제", professorName: "2학년 2학기"),
    saveEssentialDataModel(lectureName: "컴퓨터구조", professorName: "2학년 2학기"),
    saveEssentialDataModel(lectureName: "데이터통신", professorName: "2학년 2학기"),

    saveEssentialDataModel(lectureName: "자료구조", professorName: "2학년 2학기"),
    saveEssentialDataModel(lectureName: "컴퓨터네트워크", professorName: "3학년 1학기"), //
    saveEssentialDataModel(lectureName: "프론트엔드개발", professorName: "3학년 1학기"),
    saveEssentialDataModel(lectureName: "Python프로그래밍", professorName: "1학년 2학기"),
    
    
    saveEssentialDataModel(lectureName: "알고리즘", professorName: "3학년 1학기"), //
    saveEssentialDataModel(lectureName: "모바일프로그래밍", professorName: "3학년 1학기"), //
    saveEssentialDataModel(lectureName: "프론트엔드프레임워크", professorName: "3학년 2학기"),
    saveEssentialDataModel(lectureName: "서버구축및형상관리", professorName: "3학년 2학기"), //
    
    
    saveEssentialDataModel(lectureName: "졸업지도", professorName: "4학년 1학기"), //
    saveEssentialDataModel(lectureName: "소프트웨어캡스톤디자인", professorName: "4학년 1학기"), //
    saveEssentialDataModel(lectureName: "시스템분석및설계", professorName: "3학년 2학기"),
]



struct AllEssentialDataModel: Equatable {
    var lectureName: String
    var professorName: String
}


var allEssentialDataModel: [AllEssentialDataModel] = [
    
        AllEssentialDataModel(lectureName: "웹개발입문", professorName: "1학년 2학기"),
        AllEssentialDataModel(lectureName: "Python프로그래밍", professorName: "1학년 2학기"),
        AllEssentialDataModel(lectureName: "Java프로그래밍", professorName: "2학년 1학기"),
        AllEssentialDataModel(lectureName: "데이터베이스", professorName: "2학년 1학기"),
        AllEssentialDataModel(lectureName: "사물인터넷 기초", professorName: "2학년 1학기"),
        AllEssentialDataModel(lectureName: "운영체제", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "컴퓨터구조", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "자료구조", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "데이터통신", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "웹프로그래밍", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "데이터분석입문", professorName: "2학년 2학기"),
        AllEssentialDataModel(lectureName: "알고리즘", professorName: "3학년 1학기"), //
        AllEssentialDataModel(lectureName: "컴퓨터네트워크", professorName: "3학년 1학기"), //
        AllEssentialDataModel(lectureName: "프론트엔드개발", professorName: "3학년 1학기"),
        AllEssentialDataModel(lectureName: "모바일프로그래밍", professorName: "3학년 1학기"), //
        AllEssentialDataModel(lectureName: "고급Java프로그래밍", professorName: "3학년 1학기"),
        AllEssentialDataModel(lectureName: "Python프로젝트", professorName: "3학년 1학기"),
        AllEssentialDataModel(lectureName: "서버구축및형상관리", professorName: "3학년 2학기"), //
        AllEssentialDataModel(lectureName: "네트워크프로그래밍", professorName: "3학년 2학기"), //
        AllEssentialDataModel(lectureName: "백엔드프레임워크", professorName: "3학년 2학기"), //
        AllEssentialDataModel(lectureName: "프론트엔드프레임워크", professorName: "3학년 2학기"),
        AllEssentialDataModel(lectureName: "Java프로젝트", professorName: "3학년 2학기"),
        AllEssentialDataModel(lectureName: "시스템분석및설계", professorName: "3학년 2학기"),
        AllEssentialDataModel(lectureName: "통계자료분석및실습", professorName: "3학년 2학기"),
        AllEssentialDataModel(lectureName: "사물인터넷", professorName: "3학년 2학기"),
        AllEssentialDataModel(lectureName: "졸업지도", professorName: "4학년 1학기"), //
        AllEssentialDataModel(lectureName: "보안시스템", professorName: "4학년 1학기"),
        AllEssentialDataModel(lectureName: "소프트웨어캡스톤디자인", professorName: "4학년 1학기"), //
        AllEssentialDataModel(lectureName: "하이브리드앱프로그래밍", professorName: "4학년 1학기"),
        AllEssentialDataModel(lectureName: "인공지능", professorName: "4학년 1학기"),
        AllEssentialDataModel(lectureName: "빅데이터", professorName: "4학년 1학기"),
        AllEssentialDataModel(lectureName: "사물인터넷캡스톤디자인", professorName: "4학년 1학기"),
        AllEssentialDataModel(lectureName: "머신러닝", professorName: "4학년 2학기"),
        AllEssentialDataModel(lectureName: "빅데이터실무", professorName: "4학년 2학기")
]
