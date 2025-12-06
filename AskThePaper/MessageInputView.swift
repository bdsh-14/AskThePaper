//
//  MessageInputView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/6/25.
//

import SwiftUI

struct MessageInputView: View {
	@FocusState private var isFocused: Bool
	@Binding var messageText: String
	var onSend: () -> Void

	var body: some View {
		HStack(spacing: 10) {
			TextField("Write something", text: $messageText, axis: .vertical)
				.focused($isFocused)
				.textFieldStyle(.roundedBorder)
				.onSubmit(sendMessage)

			Button("Send message", systemImage: "arrow.up.circle.fill", action: onSend)
				.labelStyle(.iconOnly)
				.disabled(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
		}
		.padding(10)
		.onAppear {
			isFocused = true
		}
	}

	func sendMessage() {
		onSend()
		isFocused = true
	}
}

#Preview {
	MessageInputView(messageText: .constant("Example")) { }
}
