//
//  Publication.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import Foundation

import Foundation

// MARK: - Publication
struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}
