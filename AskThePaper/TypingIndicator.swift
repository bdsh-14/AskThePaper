//
//  TypingIndicator.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/6/25.
//

import SwiftUI

struct TypingIndicator: View {
	@State private var animatingDots = false

    var body: some View {
		Image(systemName: "ellipsis")
			.symbolEffect(.variableColor, isActive: animatingDots)
			.font(.title)
			.padding(.horizontal, 10)
			.padding(.vertical, 10)
			.background(.gray.opacity(0.2))
			.clipShape(.rect(cornerRadius: 16))
			.onAppear() {
				withAnimation(.linear.repeatForever()) {
					animatingDots = true
				}
			}
    }
}

#Preview {
    TypingIndicator()
}
