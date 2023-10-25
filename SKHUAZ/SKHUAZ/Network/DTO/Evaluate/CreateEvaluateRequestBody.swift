//
//  CreateEvaluateRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/09/25.
//

import Foundation

// MARK: - CreateEvaluateRequestBody
struct CreateEvaluateRequestBody: Codable {
    var lecName, profName, semester: String
    var teamPlay, task, practice, presentation: Int
    var title, review: String
    
    init(lecName: String = "", profName: String = "", semester: String = "",
         teamPlay: Int = 0, task: Int = 0, practice: Int = 0,
         presentation: Int = 0,
         title: String = "", review: String = "") {
        self.lecName = lecName
        self.profName = profName
        self.semester = semester
        self.teamPlay = teamPlay
        self.task = task
        self.practice = practice
        self.presentation = presentation
        self.title = title
        self.review = review
    }
}
