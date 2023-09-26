//
//  PreLectureRequestBodyElement.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/26.
//

import Foundation

// MARK: - PreLectureRequestBodyElement
struct PreLectureRequestBody: Encodable {
    let semester: String
    let lecNames: [String]
}


