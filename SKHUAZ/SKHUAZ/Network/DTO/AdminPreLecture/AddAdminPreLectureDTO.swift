//
//  AddAdminPreLectureDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

// MARK: - AddAdminPreLectureDTO
struct AddAdminPreLectureDTO: Codable {
    let statusCode: Int
    let message: String
    let data: adminPreLecture
}

// adminPreLecture의 경우 선수과목에서 공통되어 같이 사용
