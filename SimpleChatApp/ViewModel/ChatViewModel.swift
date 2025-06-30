//
//  ChatViewModel.swift
//  SimpleChatApp
//
//  Created by Mohit Tomar on 30/05/25.
//
import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var currentText: String = ""

    func sendMessage() {
        let trimmedText = currentText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        let userMessage = ChatMessage(text: trimmedText, isUser: true)
        messages.append(userMessage)
        currentText = ""

        simulateBotReply(to: trimmedText)
    }

    private func simulateBotReply(to userMessage: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let reply = ChatMessage(text: "Hey I'm the bot!", isUser: false)
            self.messages.append(reply)
        }
    }
}
