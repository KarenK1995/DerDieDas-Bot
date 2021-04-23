//
//  File.swift
//  
//
//  Created by Karen Karapetyan on 11.04.21.
//

import Foundation

// MARK: - Welcome
struct RSMessage: Codable {
    let updateID: Int
    let message: RSMessageData

    enum CodingKeys: String, CodingKey {
        case updateID = "update_id"
        case message
    }
}

// MARK: - Message
struct RSMessageData: Codable {
    let messageID: Int
    let from: RSFrom
    let chat: RSChat
    let date: Int
    let text: String
    let entities: [RSEntity]?

    enum CodingKeys: String, CodingKey {
        case messageID = "message_id"
        case from, chat, date, text, entities
    }
}

// MARK: - Chat
struct RSChat: Codable {
    let id: Int
    let firstName, lastName, type: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case type
    }
}

// MARK: - Entity
struct RSEntity: Codable {
    let offset, length: Int
    let type: String
}

// MARK: - From
struct RSFrom: Codable {
    let id: Int
    let isBot: Bool
    let firstName, lastName, languageCode: String

    enum CodingKeys: String, CodingKey {
        case id
        case isBot = "is_bot"
        case firstName = "first_name"
        case lastName = "last_name"
        case languageCode = "language_code"
    }
}

