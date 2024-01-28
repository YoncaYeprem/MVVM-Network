//
//  NetworkError.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation

enum NetworkError: String, Error {
    case fetchError = "Failed to fetch data"
    case invalidEndpoint = "Invalid endpoint"
    case serializationError = "Failed to decode data"
    case notExist = "Data not exist"
    case requestFailed = "Request Failed"
}
