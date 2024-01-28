//
//  PostModel.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

struct Post: Decodable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostModel = [Post]

