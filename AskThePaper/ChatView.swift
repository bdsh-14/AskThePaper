//
//  ChatView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/5/25.
//

import FoundationModels
import SwiftUI

struct ChatView: View {
	@State private var session = LanguageModelSession()
	@State private var messages: [Message] = []
	@State private var messageText = ""

	var body: some View {
		VStack {
			ScrollViewReader { proxy in
				ScrollView {
					LazyVStack(spacing: 0) {
						ForEach(messages) {
							Text($0.text)
						}
					}
					.padding()
				}
			}
			TextField("Enter a prompt", text: $messageText)
				.onSubmit(sendMessage)
		}
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
		do {
			let response = try await session.respond(to: prompt)
			messages.append(Message(text: response.content, isAI: true))
		} catch(let error) {
			print(error.localizedDescription)
		}
	}
}
