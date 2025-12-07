//
//  ChatView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/5/25.
//

import FoundationModels
import SwiftUI

struct ChatView: View {
	@State private var session: LanguageModelSession
	@State private var messages: [Message] = []
	@State private var messageText = ""
	@State private var isTyping: Bool = false

	var body: some View {
		VStack {
			ScrollViewReader { proxy in
				ScrollView {
					LazyVStack(spacing: 0) {
						ForEach(messages, content: MessageBubble.init)

						if isTyping {
							HStack {
								TypingIndicator()
								Spacer()
							}
							.transition(.move(edge: .leading))
						}
					}
					.padding()
				}
				.defaultScrollAnchor(.bottom)
				.onChange(of: messages) {
					proxy.scrollTo(messages.last?.id, anchor: .bottom)
				}
			}
			MessageInputView(messageText: $messageText, onSend: sendMessage)
		}
	}

	init(document: String) {
		let session = LanguageModelSession(instructions: "Answer questions about this text: \(document)")
		self._session = State(initialValue: session)
	}

	func sendMessage() {
		let prompt = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
		guard prompt.isEmpty == false else { return }
		messageText = ""
		messages.append(Message(text: prompt, isAI: false))

		Task {
			await respond(to: prompt)
		}
	}

	func respond(to prompt: String) async {
		defer { isTyping = false }
		do {
			isTyping = true
			let response = try await session.respond(to: prompt)
			messages.append(Message(text: response.content, isAI: true))
		} catch(let error) {
			print(error.localizedDescription)
		}
	}
}

#Preview {
	ChatView(document: "United States is the greatest nation in the world.")
}
