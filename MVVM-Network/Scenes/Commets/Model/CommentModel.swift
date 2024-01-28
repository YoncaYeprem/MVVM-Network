//
//  CommentModel.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation

// MARK: - CommentsModelElement
struct Comments: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias CommentsModel = [Comments]
