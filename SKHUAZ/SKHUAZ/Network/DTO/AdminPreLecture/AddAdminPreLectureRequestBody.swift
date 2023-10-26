//
//  AddAdminPreLectureRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/25/23.
//

import Foundation

// MARK: - AddAdminPreLectureRequestBody
struct AddAdminPreLectureRequestBody: Codable {
    var subjectName, semester, preLecName, preLecSemester: String
    
    init(subjectName: String = "", semester: String = "", preLecName: String = "", preLecSemester: String = "") {
        self.subjectName = subjectName
        self.semester = semester
        self.preLecName = preLecName
        self.preLecSemester = preLecSemester
    }
}
