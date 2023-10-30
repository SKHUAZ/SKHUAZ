//
//  EditRootRecommendRequestBody.swift
//  SKHUAZ
//
//  Created by 박신영 on 10/30/23.
//

import Foundation

struct EditRootRecommendRequestBody: Codable {
    var title, recommendation: String
    
    init(title: String = "", recommendation: String = "") {
        self.title = title
        self.recommendation = recommendation
    }
}
