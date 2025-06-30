//
//  Untitled.swift
//  SimpleChatApp
//
//  Created by Mohit Tomar on 30/05/25.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timestamp = Date()
}
