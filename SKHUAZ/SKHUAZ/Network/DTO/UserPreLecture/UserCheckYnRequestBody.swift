//
//  UserCheckYnRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/26/23.
//

import Foundation

// MARK: - UserCheckYnRequestBody
struct UserCheckYnRequestBody: Codable {
    let subjectIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case subjectIDS = "subjectIds"
    }
}
