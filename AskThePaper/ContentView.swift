//
//  ContentView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/5/25.
//

import PDFKit
import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
	enum LoadState {
		case waiting, loading, loaded(String)
	}

	@State private var loadState: LoadState = .waiting

    var body: some View {
		switch loadState {
		case .waiting:
			DroppedFileView(onDrop: handleDrop)
		case .loading:
			VStack {
				ProgressView()
				Text("Processing...")
			}
		case .loaded(let string):
			ChatView(document: string)
		}
    }

	private func handleDrop(item: Data, contentType: UTType) -> Bool {
		loadState = .loading

		let result = switch contentType {
		case .pdf: handlePdf(item)
		default: String?.none
		}

		if let result {
			loadState = .loaded(result)
			return true
		} else {
			loadState = .waiting
			return false
		}
	}

	func handlePdf(_ data: Data) -> String? {
		PDFDocument(data: data)?.string
	}
}

#Preview {
    ContentView()
}
