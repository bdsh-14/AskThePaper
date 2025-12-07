//
//  DroppedFileView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/6/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct DroppedFileView: View {
	@State private var isDraggingOver = false
	// Called after a file is dropped
	var onDrop: (Data, UTType) -> Bool

    var body: some View {
		ContentUnavailableView {
			Label("Drop Here", systemImage: "doc.fill")
		} description: {
			Text("Drag and drop a file here to ask questions about its contents.")
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(isDraggingOver ? Color.blue.opacity(0.1) : .clear)
		.overlay {
			RoundedRectangle(cornerRadius: 16)
				.strokeBorder(isDraggingOver ? Color.accentColor : .secondary, style: .init(lineWidth: 2, dash: [10, 5]))
				.padding(30)
		}
		.dropDestination(for: DroppedFile.self) { items, _ in
			guard let item = items.first else { return false }
			return onDrop(item.data, item.contentType)
		} isTargeted: {
			isDraggingOver = $0
		}
    }
}

#Preview {
	DroppedFileView { _, _ in true }
}
