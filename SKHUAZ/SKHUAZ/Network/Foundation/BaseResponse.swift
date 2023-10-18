//
//  BaseResponse.swift
//  SKHUAZ
//
//  Created by 천성우 on 2023/08/16.
//


import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var success: Bool
    var message: String?
}

struct GenericResponse<T: Codable>: Codable {
    var status_code: Int?
    var success: Bool?
    var status_message: String?
}

struct VoidResult: Codable {
    var code: Int
    var data: Bool?
    var message: String?
}

struct ErrorResult: Codable {
    var statusCode: Int
    var httpStatus: Bool?
    var errorMessage: String?
}

