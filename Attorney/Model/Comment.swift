//
//  Comment.swift
//  Attorney
//
//  Created by ThinhTCQ on 11/28/22.
//

import Foundation

struct Comment: Codable {
    let _id: String?
    let userId: ShortUser?
    let postId: ShortPost?
    let content: String?
    let created: String?
}

struct ShortPost: Codable {
    let _id : String?
    let user: String?
    let content: String?
    let mediaUrl: String?
}

struct PostCommentsResponse: Codable {
    let success: Bool?
    let message: String?
    let data: [Comment]?
}

struct CommentRequest: Codable {
    let userId: String
    let postId: String
    let content: String
}

struct CaseComment: Codable {
    let _id: String?
    let userId: ShortUser?
    let caseId: String?
    let content: String?
    let created: String?
}

struct CaseCommentsResponse: Codable {
    let success: Bool?
    let message: String?
    let data: [CaseComment]?
}

struct CaseCommentRequest: Codable {
    let userId: String
    let caseId: String
    let content: String
}

struct EditCommentRequest: Codable {
    let id: String
    let content: String
}
