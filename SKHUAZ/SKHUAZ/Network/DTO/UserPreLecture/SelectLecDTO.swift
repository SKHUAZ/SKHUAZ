//
//  SelectLecDTO.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

// MARK: - SelectLecDTO
struct SelectLecDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [selectLecData]
}

// MARK: - Datum
struct selectLecData: Codable {
    let subjectID: Int
    let subjectName: String
    var checkYn, clickYn: Bool
    let semester: String

    enum CodingKeys: String, CodingKey {
        case subjectID = "subjectId"
        case subjectName, checkYn, clickYn, semester
    }
}
