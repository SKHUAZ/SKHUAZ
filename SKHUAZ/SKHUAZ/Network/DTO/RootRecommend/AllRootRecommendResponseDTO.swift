//
//  AllRootRecommendResponseDTO..swift
//  SKHUAZ
//
//  Created by 박신영 on 2023/09/25.
//
import Foundation

// MARK: - RootRecommendResponseDTO
struct AllRootRecommendResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [AllRootRecommendData]
}

// MARK: - RootRecommendData
struct AllRootRecommendData: Codable {
    let title, recommendation, createAt, email, nickname: String
    let preLectures: [PreLecture]
    let routeId: Int

}

// MARK: - PreLecture
struct PreLecture: Codable {
    let preLectureId: Int
    let semester : String
    let lecNames : [String]

   enum CodingKeys : String , CodingKey{
        case preLectureId = "preLectureId"
        case semester = "semester"
        case lecNames = "lecNames"
   }
}


//{
//    "message" : "모든 루트평을 성공적으로 불러왔습니다.",
//    "statusCode" : 200,
//    "data" : [
//        {
//            "routeId" : 22,
//            "recommendation" : "ㄴㅁㅇㅁㄴㅇ",
//            "nickname" : "user1",
//            "title" : "ㄴㅇㅁㄴㅇ",
//            "email" : "cjs1399@office.skhu.ac.kr",
//            "createAt" : "2023-10-30T14:24:43.70619",
//            "preLectures" : [
//                {
//                    "semester" : "1학년 2학기",
//                    "preLectureId" : 247,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "웹 개발 입문",
//                        "Python 프로그래밍"
//                    ]
//                },
//                {
//                    "semester" : "2학년 1학기",
//                    "preLectureId" : 248,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "Java 프로그래밍",
//                        "전공 탐색 세미나(소프트웨어)",
//                        "데이터베이스",
//                        "사물인터넷 기초"
//                    ]
//                },
//                {
//                    "semester" : "2학년 2학기",
//                    "preLectureId" : 249,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "운영체제",
//                        "컴퓨터구조",
//                        "데이터통신",
//                        "웹 프로그래밍",
//                        "데이터 분석 입문"
//                    ]
//                },
//                {
//                    "semester" : "3학년 1학기",
//                    "preLectureId" : 250,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "프론트엔드 개발",
//                        "Python 프로젝트"
//                    ]
//                },
//                {
//                    "semester" : "3학년 2학기",
//                    "preLectureId" : 251,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "Java 프로젝트",
//                        "사물인터넷"
//                    ]
//                },
//                {
//                    "semester" : "4학년 1학기",
//                    "preLectureId" : 252,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "빅데이터",
//                        "사물인터넷 캡스톤디자인"
//                    ]
//                },
//                {
//                    "semester" : "4학년 2학기",
//                    "preLectureId" : 253,
//                    "email" : "cjs1399@office.skhu.ac.kr",
//                    "lecNames" : [
//                        "머신러닝",
//                        "빅데이터 실무"
//                    ]
//                }
//            ]
//        },
//    ]
//}
