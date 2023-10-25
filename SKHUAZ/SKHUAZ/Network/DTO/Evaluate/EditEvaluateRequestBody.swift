//
//  EditEvaluateRequestBody.swift
//  SKHUAZ
//
//  Created by 천성우 on 10/21/23.
//

import Foundation

// MARK: - EditEvaluateRequestBody
struct EditEvaluateRequestBody: Codable {
    var deptName, lecName, profName, semester: String
    var teamPlay, task, practice, presentation: Int
    var title, review: String
    
    init(deptName: String = "", lecName: String = "", profName: String = "", semester: String = "",
         teamPlay: Int = 0, task: Int = 0, practice: Int = 0,
         presentation: Int = 0,
         title: String = "", review: String = "") {
        self.deptName = deptName
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
