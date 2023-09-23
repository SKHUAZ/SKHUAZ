//
//  URLConst.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//

import Foundation

struct APIConstants {
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
}

extension APIConstants {
    
    static var defaultHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
}
