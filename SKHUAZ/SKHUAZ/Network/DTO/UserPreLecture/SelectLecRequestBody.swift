//
//  SelectLecRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

// MARK: - SelectLecRequestBody
struct SelectLecRequestBody: Codable {
    var semester: String
    
    init(semester: String = "") {
        self.semester = semester
    }
}
