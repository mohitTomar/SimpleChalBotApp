//
//  ChatViewModelTests.swift
//  ChatViewModelTests
//
//  Created by Mohit Tomar on 30/05/25.
//

import XCTest
@testable import SimpleChatApp

final class ChatViewModelTests: XCTestCase {

    func testSendingMessageAddsUserMessage() {
        let viewModel = ChatViewModel()
        viewModel.currentText = "Hello there"
        viewModel.sendMessage()

        XCTAssertEqual(viewModel.messages.count, 1)
        XCTAssertEqual(viewModel.messages.first?.text, "Hello there")
        XCTAssertTrue(viewModel.messages.first?.isUser ?? false)
    }

    func testEmptyMessageIsIgnored() {
        let viewModel = ChatViewModel()
        viewModel.currentText = "    "
        viewModel.sendMessage()

        XCTAssertEqual(viewModel.messages.count, 0)
    }

    func testBotReplyAppearsAfterDelay() {
        let expectation = XCTestExpectation(description: "Bot reply should appear after 5 seconds")

        let viewModel = ChatViewModel()
        viewModel.currentText = "Hi bot"
        viewModel.sendMessage()

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            if viewModel.messages.count == 2 &&
                !viewModel.messages[1].isUser &&
                viewModel.messages[1].text.contains("Hi bot") {
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 7)
    }
}
